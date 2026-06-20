const puppeteer = require('puppeteer');
const path = require('path');
const fs = require('fs');

const BASE_URL = 'http://localhost:8081';
const SCREENSHOTS_DIR = path.join(__dirname, 'screenshots');

const pages = [
  { url: '/checkout', filename: '07-checkout.png', name: 'Checkout' },
  { url: '/order-history', filename: '08-order-history.png', name: 'Order History' },
  { url: '/profile-page', filename: '09-profile.png', name: 'Profile' },
  { url: '/product-management', filename: '10-admin-products.png', name: 'Admin Products' },
  { url: '/order-management', filename: '11-admin-orders.png', name: 'Admin Orders' },
];

async function captureScreenshots() {
  let browser;
  try {
    browser = await puppeteer.launch({
      headless: 'new',
      args: ['--no-sandbox', '--disable-setuid-sandbox'],
    });

    console.log('Browser launched. Capturing remaining screenshots...\n');

    for (const page of pages) {
      try {
        const browserPage = await browser.newPage();
        
        console.log(`Capturing ${page.name} from ${BASE_URL}${page.url}...`);
        
        // Navigate with longer timeout
        await browserPage.goto(`${BASE_URL}${page.url}`, {
          waitUntil: 'networkidle0',
          timeout: 30000,
        }).catch(err => {
          // Ignore navigation errors (e.g., redirects for auth pages)
          console.log(`  (Navigation note: ${err.message.substring(0, 50)}...)`);
        });
        
        // Wait for page to fully render
        await new Promise(r => setTimeout(r, 2000));
        
        const filepath = path.join(SCREENSHOTS_DIR, page.filename);
        await browserPage.screenshot({ path: filepath, fullPage: true });
        
        console.log(`✓ Saved: ${page.filename}\n`);
        await browserPage.close();
      } catch (error) {
        console.error(`✗ Error capturing ${page.name}:`, error.message);
      }
    }

    console.log('Screenshot capture complete!');
    
  } catch (error) {
    console.error('Error launching browser:', error);
  } finally {
    if (browser) {
      await browser.close();
    }
  }
}

captureScreenshots();
