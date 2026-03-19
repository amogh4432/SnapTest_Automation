const { $ } = require('@wdio/globals')
const Page = require('./page');

/**
 * sub page containing specific selectors and methods for a specific page
 */
class SecurePage extends Page {
    /**
     * define selectors using getter methods
     */
    get adminDashboard () {
        return $('//h1[text()="Admin Dashboard"]');
    }
}

module.exports = new SecurePage();
