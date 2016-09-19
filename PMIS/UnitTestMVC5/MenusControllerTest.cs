using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Web.Mvc;
using Mvc5.Controllers;

namespace UnitTestMVC5
{
    /// <summary>
    /// Summary description for MenusControllerTest
    /// </summary>
    [TestClass]
    public class MenusControllerTest
    {
        public MenusControllerTest()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        private TestContext testContextInstance;

        /// <summary>
        ///Gets or sets the test context which provides
        ///information about and functionality for the current test run.
        ///</summary>
        public TestContext TestContext
        {
            get
            {
                return testContextInstance;
            }
            set
            {
                testContextInstance = value;
            }
        }

        #region Additional test attributes
        //
        // You can use the following additional attributes as you write your tests:
        //
        // Use ClassInitialize to run code before running the first test in the class
        // [ClassInitialize()]
        // public static void MyClassInitialize(TestContext testContext) { }
        //
        // Use ClassCleanup to run code after all tests in a class have run
        // [ClassCleanup()]
        // public static void MyClassCleanup() { }
        //
        // Use TestInitialize to run code before running each test 
        // [TestInitialize()]
        // public void MyTestInitialize() { }
        //
        // Use TestCleanup to run code after each test has run
        // [TestCleanup()]
        // public void MyTestCleanup() { }
        //
        #endregion

        [TestMethod]
        public void Index_Returs_ActionResult()
        {
            MenusController controller = new MenusController();

            var actual = controller.Edit(2);

            Assert.IsInstanceOfType(actual);


            //
            // TODO: Add test logic here
            //
        }
    }
}
