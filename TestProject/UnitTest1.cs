namespace TestProject
{
    public class Tests
    {
        [SetUp]
        public void Setup()
        {
        }

        [Test]
        public void Test1()
        {
            Assert.Pass();
        }

        [Test]
        public void TestToFail()
        {
            Assert.Pass();
            // Assert.Fail();
        }
    }
}