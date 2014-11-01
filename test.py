from testcase import *

class TestCaseTest(TestCase):
  def setUp(self):
    self.result= TestResult()

  def testTemplateMethod(self):
    test= WasRun("testMethod")
    test.run(self.result)
    assert("setUp testMethod tearDown " == test.log)

  def testResult(self):
    test= WasRun("testMethod")
    test.run(self.result)
    assert("1 run, 0 failed" == self.result.summary())

  def testFailedResult(self):
    test= WasRun("testBrokenMethod")
    test.run(self.result)
    assert(
            (
              "Traceback (most recent call last):\n"
              "  File \"/Users/rain/tdd-by-example/testcase.py\", line 18, in run\n"
              "    method()\n"
              "  File \"/Users/rain/tdd-by-example/testcase.py\", line 69, in testBrokenMethod\n"
              "    raise Exception\n"
              "Exception\n"
              "1 run, 1 failed"
            ) == self.result.summary()
          )

  def testFailedResultFormatting(self):
    self.result.testStarted()
    self.result.testFailed("Exception\n")
    assert("Exception\n1 run, 1 failed" == self.result.summary())

  def testSuite(self):
    suite= TestSuite()
    suite.add(WasRun("testMethod"))
    suite.add(WasRun("testBrokenMethod"))
    suite.run(self.result)
    assert("2 run, 1 failed" == self.result.summary().splitlines()[-1])

  def testNotification(self):
    self.count= 0
    self.result.addListener(self)
    WasRun("testNotification").run(self.result)
    assert(1 == self.count)

  def startTest(self):
    self.count= self.count + 1

suite= TestSuite()
suite.add(TestCaseTest("testTemplateMethod"))
suite.add(TestCaseTest("testResult"))
suite.add(TestCaseTest("testFailedResult"))
suite.add(TestCaseTest("testFailedResultFormatting"))
suite.add(TestCaseTest("testSuite"))
suite.add(TestCaseTest("testNotification"))
result= TestResult()
suite.run(result)
print result.summary()
