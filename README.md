# 🧪 SnapTest Automation Framework
[![SnapTest CI Pipeline](https://github.com/amogh4432/SnapTest_Automation/actions/workflows/main.yml/badge.svg)](https://github.com/amogh4432/SnapTest_Automation/actions)

A professional, Dockerized E2E testing framework designed for the SnapTest Web Application. Built with a focus on portability, scalability, and automated reporting.

## 🌟 Key Features
* **Framework:** WebdriverIO (Async mode)
* **Architecture:** Page Object Model (POM)
* **Portability:** Fully Dockerized (runs on `node:20-slim`)
* **Reporting:** Allure Reports with historical trends and screenshots on failure.
* **CI/CD:** Automated execution via GitHub Actions with Email Notifications.

## 📊 Live Test Report
**View Latest Results:** [https://amogh4432.github.io/SnapTest_Automation/](https://amogh4432.github.io/SnapTest_Automation/)

## 🏗️ System Architecture
This framework operates in a **Distributed CI/CD** environment:
1. **Trigger:** Received via `repository_dispatch` from the Web App repo.
2. **Environment:** A Docker container is spun up in the cloud.
3. **Execution:** Chrome runs in `headless` mode against the production URL.
4. **Notification:** Results are emailed to stakeholders upon completion.

## 🚀 Local Execution
To run the tests on your machine using Docker:
```bash
# Build the image
docker build -t wdio-docker .

# Run tests and sync results
docker run --rm -v ${PWD}/allure-results:/usr/src/app/allure-results wdio-docker
