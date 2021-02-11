package tests;

import org.testng.annotations.Test;

import com.simple.TestBase;

public class Facebook extends TestBase{
	
	@Test
	public void getUrl() {
		System.out.println("in test");
		driver.get("http://facebook.com");
		System.out.println(driver.getCurrentUrl());
	}

}
