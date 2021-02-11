package com.simple;

import org.testng.annotations.Test;

public class Google extends TestBase {
	
	@Test
	public void getUrl() {
		System.out.println("in tests");
		driver.get("http://google.com");
		System.out.println(driver.getCurrentUrl());
	}
	

}
