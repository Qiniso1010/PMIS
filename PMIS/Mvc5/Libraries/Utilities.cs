using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Runtime.InteropServices;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.SessionState;

namespace Mvc5.Libraries
{
    public static class Utilities
    {

        public static String GetIPAddress()
        {
            System.Web.HttpContext context = System.Web.HttpContext.Current;
            string strIpAddress;
            strIpAddress = context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (!string.IsNullOrEmpty(strIpAddress))
            {
                strIpAddress = context.Request.ServerVariables["REMOTE_ADDR"];
            }
            return Convert.ToString(strIpAddress);
        }


        public static string UpperFirst(string s)
        {
            try
            {
                TextInfo txt = null;
                if (s != null)
                {
                    return txt.ToTitleCase(s);
                }
                else
                {
                    return null;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
            
        }

        public static string SessionId()
        {
            try
            {
                HttpSessionState ss = HttpContext.Current.Session;
                return ss.SessionID;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public static object FixNull(object o)
        {
            try
            {
                if (Convert.IsDBNull(o))
                {
                    return null;
                }
                else
                {
                    return o;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }


        public static object fixdbnull(string fixthis)
        {
            try
            {
                if (Convert.IsDBNull(fixthis))
                {
                    fixthis = "";
                }
                else
                {
                    fixthis = fixthis;
                }

                return fixthis;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public static string ReplaceMagic(String strValue)
        {
            try
            {
                return strValue.Replace("'", "''").Replace("&#34", "\"");
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public static string FriendlyString(String str)
        {
            try
            {
                StringBuilder sb = new StringBuilder(str);

                sb.Replace("/", "-");
                sb.Replace(",", "-");
                sb.Replace("&", "-");
                sb.Replace("$", "-");
                sb.Replace("*", "-");
                sb.Replace("+", "-");
                sb.Replace("=", "-");
                sb.Replace("&", "-");
                sb.Replace("(", "-");
                sb.Replace("()", "-");
                sb.Replace(")", "-");
                sb.Replace("@", "-");
                sb.Replace("#", "-");
                sb.Replace("%", "-");
                sb.Replace("\\", "-");
                sb.Replace(" ", "-");

                return sb.ToString().ToLower();
                
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public static bool IsValidEmail(string strIn)
        {
            try
            {
                return Regex.IsMatch(strIn, ("^([\\w-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([\\w-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$"));
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public static bool IsNumberOnly(string strIn)
        {
            try
            {
                return !Regex.IsMatch(strIn, ("[^0-9]"));
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        // filter query string
        public static string FilterString(string q)
        {
            try
            {
                if (q != null)
                {
                    return HttpUtility.HtmlEncode(q);
                }
                else
                {
                    return null;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public static string filterText(string q)
        {
            if (q != null)
            {
                return HttpUtility.UrlDecode(q);
            }
            else
            {
                return null;
            }
        }
        private static string _ReplaceSearchWord(Match m)
        {
            return "<span style='font-weight:bold; background: yellow;'>" + m.Value + "</span>";
        }

        public static string highlighText(string Search_Str, string InputTxt)
        {
            string functionReturnValue = null;

            Regex RegExp = new Regex(Search_Str.Replace(" ", "|").Trim(), RegexOptions.IgnoreCase);
            functionReturnValue = RegExp.Replace(InputTxt, new MatchEvaluator(_ReplaceSearchWord));
            RegExp = null;
            return functionReturnValue;

        }

        public static string ToUpperFirstLetter(this string source)
        {
            if (string.IsNullOrEmpty(source))
                return string.Empty;
            // convert to char array of the string
            char[] letters = source.ToCharArray();
            // upper case the first char
            letters[0] = char.ToUpper(letters[0]);
            // return the array made of the new char array
            return new string(letters);
        }
        // Sending email Own Server
        public static void SendingEmail(string EmailTo, string SubjectTxt, string BodyText,string AttachmentFile)
        {
            try
            {
                string subject = SubjectTxt;
                string body = BodyText;

                string EmailFrom = Mvc5.Areas.Auth.Libraries.Init.email;
                string EmailPassword = Mvc5.Areas.Auth.Libraries.Init.password;

                using (MailMessage mmx = new MailMessage(EmailFrom, EmailTo))
                {
                    mmx.Subject = subject;
                    mmx.Body = body;
                    mmx.IsBodyHtml = true;
                    mmx.Priority = MailPriority.High;
                    if (AttachmentFile != null)
                    {
                        mmx.Attachments.Add(new Attachment(AttachmentFile));
                    }
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = Mvc5.Areas.Auth.Libraries.Init.SMTP;
                    smtp.Send(mmx);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        // Send Email
        public static void SendEmailGmail(string EmailTo, string SubjectTxt, string BodyText,string AttachmentFile)
        {
            try
            {
                string EmailFrom = Mvc5.Areas.Auth.Libraries.Init.email;
                string EmailPassword = Mvc5.Areas.Auth.Libraries.Init.password;

                string to = EmailTo;
                string @from = EmailFrom;
                string subject = SubjectTxt;
                string body = BodyText;

                using (MailMessage mm = new MailMessage(EmailFrom, EmailTo)) 
                {
                    mm.Subject = SubjectTxt;
                    mm.Body = BodyText;
                    mm.IsBodyHtml = true;
                    mm.Priority = MailPriority.High;
                    if (AttachmentFile != null)
                    {
                        mm.Attachments.Add(new Attachment(AttachmentFile));
                    }

                    SmtpClient smtp = new SmtpClient();
                    smtp.Host =  Mvc5.Areas.Auth.Libraries.Init.GmailSMTP;
                    smtp.EnableSsl = true;
                    NetworkCredential NetworkCred = new NetworkCredential(EmailFrom, EmailPassword);
                    smtp.UseDefaultCredentials = true;
                    smtp.Credentials = NetworkCred;
                    smtp.Port = 587;
                    smtp.Timeout = 0;
                    smtp.Send(mm);
                }
            }
            catch (Exception ex)
            {
               throw ex;
            }

        }

        // Get Token for Login
        public static string GetTokenLogin(string userId)
        {
            try
            {
                string combine = GetIPAddress() + Secure.RandomString(10) + SessionId() + userId;
                string token = Secure.GenEncryptSHA1(combine.ToString().ToLower());
                return token;
            }
            catch (Exception ex)
            {
                return null;
            }

        }

        // Get Count Between Date
        public static int GetCountDate(DateTime CurrentDate)
        {
            try
            {
                int result = Convert.ToInt16((DateTime.Now - CurrentDate).TotalDays);
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static string FormatNum(double number)
        {
            try
            {
                return String.Format("{0:N}", number);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static string GetFileSize(double size)
        {
            try
            {
                double size_file = Convert.ToDouble(size) / 1024;

                if (size_file > 1000 && size_file < 1000000)
                {
                    double mb = (Convert.ToDouble(size_file) / 1024);
                    return Convert.ToString(FormatNum(mb)) + " MB";
                }
                else if (size_file > 1000000)
                {
                    double mb = ((Convert.ToDouble(size_file) / 1024) / 1024);
                    return Convert.ToString(FormatNum(mb)) + " GB";
                }
                else if (size_file.Equals(0) == true)
                {
                    return "";
                }
                else
                {
                    return Convert.ToString(FormatNum(size_file)) + " KB";
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        // Delete File From Path
        public static void DeleteFile(string path)
        {
            try
            {
                if (System.IO.File.Exists(path))
                {
                    System.IO.File.Delete(path);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        // Copy Files
        public static void CopyFile(string current_path,string present_path)
        {
            //if (!Directory.Exists(current_path))
            //    Directory.CreateDirectory(current_path);

            ////3.Copy the file with the new name
            if (File.Exists(current_path))
                File.Copy(current_path, present_path);
        }

        // Get Transaction Number
        public static string TranNumber(string num)
        {
            string hasil = null;
            num = num + 1;
            if (num.Length == 1)
            {
                hasil = "0000000" + Convert.ToString(num);
            }
            else if (num.Length == 2)
            {
                hasil = "000000" + Convert.ToString(num);
            }
            else if (num.Length == 3)
            {
                hasil = "00000" + Convert.ToString(num);
            }
            else if (num.Length == 4)
            {
                hasil = "0000" + Convert.ToString(num);
            }
            else if (num.Length == 5)
            {
                hasil = "000" + Convert.ToString(num);
            }
            else if (num.Length == 6)
            {
                hasil = "00" + Convert.ToString(num);
            }
            else if (num.Length == 7)
            {
                hasil = "0" + Convert.ToString(num);
            }
            else
            {
                hasil = Convert.ToString(num);
            }
            return hasil;
        }

        // CREATE : Thumbnail
        public static Image ScaleImage(Image image, int maxWidth, int maxHeight)
        {

            //public static void Test()
            //{
            //    using (var image = Image.FromFile(@"c:\logo.png"))
            //    using (var newImage = ScaleImage(image, 300, 400))
            //    {
            //        newImage.Save(@"c:\test.png", ImageFormat.Png);
            //    }
            //}

            var ratioX = (double)maxWidth / image.Width;
            var ratioY = (double)maxHeight / image.Height;
            var ratio = Math.Min(ratioX, ratioY);

            var newWidth = (int)(image.Width * ratio);
            var newHeight = (int)(image.Height * ratio);

            var newImage = new Bitmap(newWidth, newHeight);

            using (var graphics = Graphics.FromImage(newImage))
                graphics.DrawImage(image, 0, 0, newWidth, newHeight);

            return newImage;
        }

        // CREATE : Resize Image
        public static Bitmap ResizeImage(Image image, int width, int height)
        {
            //public byte[] imageToByteArray(System.Drawing.Image imageIn)
            //{
            //MemoryStream ms = new MemoryStream();
            //imageIn.Save(ms,System.Drawing.Imaging.ImageFormat.Gif);
            //return  ms.ToArray();
            // }
            //you can do the same but inverted to get it out and display it as image from the DB:

            //public Image byteArrayToImage(byte[] byteArrayIn)
            //   {
            //     MemoryStream ms = new MemoryStream(byteArrayIn);
            //     Image returnImage = Image.FromStream(ms);
            //     return returnImage;
            //    }
            var destRect = new Rectangle(0, 0, width, height);
            var destImage = new Bitmap(width, height);

            destImage.SetResolution(image.HorizontalResolution, image.VerticalResolution);

            using (var graphics = Graphics.FromImage(destImage))
            {
                graphics.CompositingMode = CompositingMode.SourceCopy;
                graphics.CompositingQuality = CompositingQuality.HighQuality;
                graphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
                graphics.SmoothingMode = SmoothingMode.HighQuality;
                graphics.PixelOffsetMode = PixelOffsetMode.HighQuality;

                using (var wrapMode = new ImageAttributes())
                {
                    wrapMode.SetWrapMode(WrapMode.TileFlipXY);
                    graphics.DrawImage(image, destRect, 0, 0, image.Width, image.Height, GraphicsUnit.Pixel, wrapMode);
                }
            }

            return destImage;
        }

        // Base64 To Image
        //Utilities.Base64ToImage(img).Save(Server.MapPath("~/Assets/Catatan/" + random_name));
        public static Image Base64ToImage(string base64String)
        {
            // Convert Base64 String to byte[]
            byte[] imageBytes = Convert.FromBase64String(base64String);
            MemoryStream ms = new MemoryStream(imageBytes, 0,
              imageBytes.Length);

            // Convert byte[] to Image
            ms.Write(imageBytes, 0, imageBytes.Length);
            Image image = Image.FromStream(ms, true);
            return image;
        }

        // Set Random String
        public static string RandomString(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            var random = new Random();
            return new string(Enumerable.Repeat(chars, length)
              .Select(s => s[random.Next(s.Length)]).ToArray());
        }

        // Using ------------>
        //var inputPath = Server.MapPath("~/Assets/Catatan/" + random_name);
        //var outputPath = inputPath.Replace(".png", "-out.png");

        //var bitmap = new Bitmap(inputPath);
        //var cropped = Utilities.TrimBitmap(bitmap);
        //cropped.Save(outputPath, ImageFormat.Png); 
        public static Bitmap TrimBitmap(Bitmap source)
        {
            Rectangle srcRect = default(Rectangle);
            BitmapData data = null;
            try
            {
                data = source.LockBits(new Rectangle(0, 0, source.Width, source.Height), ImageLockMode.ReadOnly, PixelFormat.Format32bppArgb);
                byte[] buffer = new byte[data.Height * data.Stride];
                Marshal.Copy(data.Scan0, buffer, 0, buffer.Length);
                int xMin = int.MaxValue;
                int xMax = 0;
                int yMin = int.MaxValue;
                int yMax = 0;
                for (int y = 0; y < data.Height; y++)
                {
                    for (int x = 0; x < data.Width; x++)
                    {
                        byte alpha = buffer[y * data.Stride + 4 * x + 3];
                        if (alpha != 0)
                        {
                            if (x < xMin) xMin = x;
                            if (x > xMax) xMax = x;
                            if (y < yMin) yMin = y;
                            if (y > yMax) yMax = y;
                        }
                    }
                }
                if (xMax < xMin || yMax < yMin)
                {
                    // Image is empty...
                    return null;
                }
                srcRect = Rectangle.FromLTRB(xMin, yMin, xMax, yMax);
            }
            finally
            {
                if (data != null)
                    source.UnlockBits(data);
            }

            Bitmap dest = new Bitmap(srcRect.Width, srcRect.Height);
            Rectangle destRect = new Rectangle(0, 0, srcRect.Width, srcRect.Height);
            using (Graphics graphics = Graphics.FromImage(dest))
            {
                graphics.DrawImage(source, destRect, srcRect, GraphicsUnit.Pixel);
            }
            return dest;
        }

        /// <summary>
        /// Creates the folder if needed.
        /// </summary>
        /// <param name="path">The path.</param>
        /// <returns></returns>
        public static bool CreateFolderIfNeeded(string path)
        {
            bool result = true;
            if (!Directory.Exists(path))
            {
                try
                {
                    Directory.CreateDirectory(path);
                }
                catch (Exception)
                {
                    /*TODO: You must process this exception.*/
                    result = false;
                }
            }
            return result;
        }






        
    }
}