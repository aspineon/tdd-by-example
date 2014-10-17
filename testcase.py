import traceback

class TestCase:
    def __init__(self, name):
      self.name = name

    def setUp(self):
      pass

    def tearDown(self):
      pass

    def run(self):
      result= TestResult()
      result.testStarted()
      self.setUp()
      try:
        method = getattr(self, self.name)
        method()
      except:
        result.testFailed(traceback.format_exc())
      self.tearDown()
      return result

class TestResult:
    def __init__(self):
      self.runCount= 0
      self.errorCount= 0
      self.errorLog= ""

    def testStarted(self):
      self.runCount= self.runCount + 1

    def testFailed(self, errorMessage):
      self.errorCount= self.errorCount + 1
      self.errorLog= self.errorLog + errorMessage

    def summary(self):
      return "%s%d run, %d failed" % (self.errorLog, self.runCount, self.errorCount)

class WasRun(TestCase):
  def __init__(self, name):
      TestCase.__init__(self, name)

  def setUp(self):
      self.wasRun = None
      self.log = "setUp "

  def testMethod(self):
      self.log= self.log + "testMethod "

  def testBrokenMethod(self):
      raise Exception

  def tearDown(self):
      self.log= self.log + "tearDown "
