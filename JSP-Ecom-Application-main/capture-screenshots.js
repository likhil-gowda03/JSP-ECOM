const puppeteer = require('puppeteer');
const path = require('path');
const fs = require('fs');

const BASE_URL = 'http://localhost:8081';
const SCREENSHOTS_DIR = path.join(__dirname, 'screenshots');

// Ensure screenshots directory exists
if (!fs.existsSync(SCREENSHOTS_DIR)) {
  fs.mkdirSync(SCREENSHOTS_DIR, { recursive: true });
}

const pages = [
  { url: '/', filename: '01-homepage.png', name: 'Homepage' },
  { url: '/shop', filename: '02-shop.png', name: 'Shop' },
  { url: '/product-detail?id=1', filename: '03-product-detail.png', name: 'Product Detail' },
  { url: '/cart', filename: '04-cart.png', name: 'Shopping Cart' },
  { url: '/login', filename: '05-login.png', name: 'Login' },
  { url: '/register', filename: '06-register.png', name: 'Register' },
];

async function captureScreenshots() {
  let browser;
  try {
    browser = await puppeteer.launch({
      headless: 'new',
      args: ['--no-sandbox', '--disable-setuid-sandbox'],
    });

    console.log('Browser launched. Capturing screenshots...\n');

    for (const page of pages) {
      try {
        const browserPage = await browser.newPage();
        await browserPage.setViewport({ width: 1280, height: 800 });
        
        console.log(`Capturing ${page.name} from ${BASE_URL}${page.url}...`);
        await browserPage.goto(`${BASE_URL}${page.url}`, {
          waitUntil: 'networkidle0',
          timeout: 30000,
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
    console.log(`Screenshots saved to: ${SCREENSHOTS_DIR}`);
    
  } catch (error) {
    console.error('Error launching browser:', error);
  } finally {
    if (browser) {
      await browser.close();
    }
  }
}

captureScreenshots();
