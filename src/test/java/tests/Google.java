package tests;

import org.testng.annotations.Test;

import com.simple.TestBase;

public class Google extends TestBase {
	
	@Test
	public void getUrl() {
		System.out.println("in tests");
		driver.get("http://google.com");
		System.out.println(driver.getCurrentUrl());
	}
	

}
