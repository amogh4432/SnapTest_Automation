const { expect } = require('@wdio/globals')
const LoginPage = require('../pageobjects/login.page')
const SecurePage = require('../pageobjects/secure.page')
const { addStep } = require('@wdio/allure-reporter')

describe('My Login application', () => {
    it('should login with valid credentials', async () => {
        await LoginPage.open()

        await LoginPage.login('admin', 'password123')
        await expect(SecurePage.adminDashboard).toBeExisting()
        await addStep('Admin Dashboard is visible')
        await expect(SecurePage.adminDashboard).toHaveText(
            expect.stringContaining('Admin Dashboard'))
        await addStep(`Admin Dashboard has correct text content: ${await SecurePage.adminDashboard.getText()}`)
        await addStep('Login test completed successfully final attempt')
    })
})

