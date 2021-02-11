package com.simple;

import java.net.MalformedURLException;
import java.net.URL;

import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeTest;

import io.github.bonigarcia.wdm.WebDriverManager;

public class TestBase {
	RemoteWebDriver driver;
	DesiredCapabilities dc;

	@BeforeTest
	public void createDriver() throws MalformedURLException {

		/*
		 * WebDriverManager.chromedriver().setup(); driver = new ChromeDriver();
		 */

		String host = "localhost";

		if (System.getProperty("BROWSER") != null && System.getProperty("BROWSER").equalsIgnoreCase("firefox")) {
			dc = DesiredCapabilities.firefox();
		} else if (System.getProperty("BROWSER") != null && System.getProperty("BROWSER").equalsIgnoreCase("chrome")) {
			dc = DesiredCapabilities.chrome();
		} else {
			dc = DesiredCapabilities.chrome();
		}

		if (System.getProperty("HUB_HOST") != null) {
			host = System.getProperty("HUB_HOST");
		}

		String finalUrl = "http://" + host + ":4444/wd/hub";
		driver = new RemoteWebDriver(new URL(finalUrl), dc);

	}

	@AfterMethod(alwaysRun = true)
	public void tearDown() {
		driver.quit();

	}

}
