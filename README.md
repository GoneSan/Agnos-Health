## Agnos Health — Registration Page Automated Tests
Automated UI test suite for the **Agnos Health** registration page, built with [Robot Framework](https://robotframework.org/) and [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/).

## 📋 Test Scenarios

| Test Case | Description | Type |
|-----------|-------------|------|
| TC01 | Register with valid data | ✅ Positive |
| TC02 | Register with invalid email format | ❌ Negative |
| TC03 | Register with short password (< 8 chars) | ❌ Negative |
| TC04 | Register with password missing a digit | ❌ Negative |
| TC05 | Register with password missing an uppercase letter | ❌ Negative |
| TC06 | Register with password missing a special character | ❌ Negative |
| TC07 | Correct password but mismatched confirm password | ❌ Negative |
| TC08 | Mismatched password and confirm password | ❌ Negative |
| TC09 | Click confirm button without entering any data | ❌ Negative |

## 📁 Project Structure

```
Agnos/
└── Register/
    ├── variable.robot    # Test data, locators, URLs, and validation messages
    ├── keyword.robot     # Reusable keywords (actions & verifications)
    └── testcase.robot    # All test cases with setup/teardown
```

## 🛠️ Prerequisites

- **Python 3.8+** — [Download here](https://www.python.org/downloads/)
- **Google Chrome** — [Download here](https://www.google.com/chrome/)
- **ChromeDriver** — must match your Chrome version ([Download here](https://googlechromelabs.github.io/chrome-for-testing/))
  > Make sure `chromedriver` is available in your system `PATH`.

## ⚙️ Environment Setup

### 1. Clone the Repository

```bash
git clone https://github.com/GoneSan/Agnos-Health.git
cd Agnos-Health
```

### 2. Create a Virtual Environment (Recommended)

```bash
python -m venv venv
source venv/bin/activate        # macOS / Linux
# venv\Scripts\activate         # Windows
```

### 3. Install Dependencies

```bash
pip install robotframework
pip install robotframework-seleniumlibrary
```
### 4. Verify Installation

```bash
robot --version
```

You should see output like `Robot Framework 7.x (Python 3.x.x on ...)`.

## 🚀 Running the Tests

### Run All Test Cases

```bash
robot Register/testcase.robot
```

### Run Only Positive Cases

```bash
robot --include "Positive Case" Register/testcase.robot
```

### Run Only Negative Cases

```bash
robot --include "Negative Case" Register/testcase.robot
```

### Run a Specific Test Case

```bash
robot --test "TC01 Register With Valid Data" Register/testcase.robot
```

## 📊 Test Reports

After execution, Robot Framework automatically generates reports in the current directory:

| File | Description |
|------|-------------|
| `report.html` | Detailed test report with pass/fail summary |
| `log.html` | Step-by-step execution log with screenshots |
| `output.xml` | Machine-readable output for CI/CD integration |

Open `report.html` in your browser to view the results:

```bash
open report.html        # macOS
# xdg-open report.html  # Linux
# start report.html     # Windows
```

## 🔧 Configuration

You can customize test data by editing `Register/variable.robot`:

## 📝 Notes

- The test targets the **dev environment**: `https://dev.app.agnoshealth.com`
- Test setup automatically opens the browser and navigates to the registration page.
- Test teardown closes all browser instances after each test.
- TC07 includes a known bug note — confirm password validation may not behave as expected.
