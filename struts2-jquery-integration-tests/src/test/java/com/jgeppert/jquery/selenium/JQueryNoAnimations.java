package com.jgeppert.jquery.selenium;

import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;

public class JQueryNoAnimations implements ExpectedCondition<Boolean> {

    @Override
    public Boolean apply(final WebDriver driver) {
        return (Boolean) ((JavascriptExecutor) driver).executeScript("return jQuery(':animated').length === 0");
    }

}
