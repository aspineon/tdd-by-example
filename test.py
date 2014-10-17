from testcase import *

class TestCaseTest(TestCase):
  def testTemplateMethod(self):
    test= WasRun("testMethod")
    test.run()
    assert("setUp testMethod tearDown " == test.log)

  def testResult(self):
    test= WasRun("testMethod")
    result= test.run()
    assert("1 run, 0 failed" == result.summary())

  def testFailedResult(self):
    test= WasRun("testBrokenMethod")
    result= test.run()
    assert(
            (
              "Traceback (most recent call last):\n"
              "  File \"/Users/rain/tdd-by-example/testcase.py\", line 19, in run\n"
              "    method()\n"
              "  File \"/Users/rain/tdd-by-example/testcase.py\", line 53, in testBrokenMethod\n"
              "    raise Exception\n"
              "Exception\n"
              "1 run, 1 failed"
            ) == result.summary()
          )

  def testFailedResultFormatting(self):
    result= TestResult()
    result.testStarted()
    result.testFailed("Exception\n")
    assert("Exception\n1 run, 1 failed" == result.summary())

print TestCaseTest("testTemplateMethod").run().summary()
print TestCaseTest("testResult").run().summary()
print TestCaseTest("testFailedResult").run().summary()
print TestCaseTest("testFailedResultFormatting").run().summary()
