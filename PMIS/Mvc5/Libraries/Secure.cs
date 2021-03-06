﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Configuration;
using System.Globalization;
using System.IO;
using System.Runtime.Serialization;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Xml;
using System.Web.UI;


namespace Mvc5.Libraries
{
    public class Secure
    {
        // try to encrypt
        private static byte[] key = {
	
        };
        private static byte[] IV = {
	        0x12,
	        0x34,
	        0x56,
	        0x78,
	        0x90,
	        0xab,
	        0xcd,
	        0xef
        };
        private static string Encrypt(string stringToEncrypt, string SEncryptionKey)
        {
            try
            {
                key = System.Text.Encoding.UTF8.GetBytes(SEncryptionKey.Substring(0,8));
                DESCryptoServiceProvider des = new DESCryptoServiceProvider();
                byte[] inputByteArray = Encoding.UTF8.GetBytes(stringToEncrypt);
                MemoryStream ms = new MemoryStream();
                CryptoStream cs = new CryptoStream(ms, des.CreateEncryptor(key, IV), CryptoStreamMode.Write);
                cs.Write(inputByteArray, 0, inputByteArray.Length);
                cs.FlushFinalBlock();
                return Convert.ToBase64String(ms.ToArray());
            }
            catch (Exception e)
            {
                return e.Message;
            }
        }
        
        // try to decrypt
        private string Decrypt(string stringToDecrypt, string sEncryptionKey)
        {
            byte[] inputByteArray = new byte[stringToDecrypt.Length + 1];
            try
            {
                key = System.Text.Encoding.UTF8.GetBytes((sEncryptionKey).Substring(0,8));
                DESCryptoServiceProvider des = new DESCryptoServiceProvider();
                inputByteArray = Convert.FromBase64String(stringToDecrypt);
                MemoryStream ms = new MemoryStream();
                CryptoStream cs = new CryptoStream(ms, des.CreateDecryptor(key, IV), CryptoStreamMode.Write);
                cs.Write(inputByteArray, 0, inputByteArray.Length);
                cs.FlushFinalBlock();
                System.Text.Encoding encoding = System.Text.Encoding.UTF8;
                return encoding.GetString(ms.ToArray());
            }
            catch (Exception e)
            {
                return e.Message;
            }
        }
       
        // try encrypt password / string
        public static string EncryptPassword(string strQueryString)
        {
            string str = null;
            string @out = null;
            str = Stored.SecretKey;
            if (strQueryString != null)
            {
                @out = GenEncryptSHA1(strQueryString);
                return Encrypt(@out, str);
            }
            else
            {
                return strQueryString;
            }

        }

       
        // try to encrypt again
        public static string GenEncryptSHA1(string strPassword)
        {
            string functionReturnValue = null;
            functionReturnValue = FormsAuthentication.HashPasswordForStoringInConfigFile(strPassword, "SHA1");
            return functionReturnValue;
        }

        // random string
        public static string RandomString(int lg)
        {
            // routine to encode text to map64 ;
            return Convert.ToString(Guid.NewGuid()).Substring(0,lg);
        }

        // generate token
        public static string GetToken(string id)
        {
            string Combine = Utilities.GetIPAddress() + RandomString(10) + Utilities.SessionId() + id.ToString();
            try
            {
                string token = GenEncryptSHA1(Combine);
                return token;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}
