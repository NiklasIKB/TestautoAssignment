package stepDefinitions;

import io.cucumber.java.After;
import io.cucumber.java.en.*;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;

import static org.junit.Assert.assertEquals;

public class MyStepdefs {

    private  WebDriver driver;

    @Given("I have selected {string} as browser")
    public void iHaveSelectedBrowser(String browser) {
        if (browser.equalsIgnoreCase("chrome")) {
            driver = new ChromeDriver();
        }
        else if (browser.equalsIgnoreCase("firefox")){
            driver = new FirefoxDriver();
        }
    }
    @And("I have navigated to {string}")
    public void iHaveNavigatedTo(String link) {
        driver.get(link);
    }

    @When("I have entered {string} with value {string}")
    public void iHaveEntered(String field, String value) {
        switch (field) {
            case "age":
                driver.findElement(By.cssSelector("input[name='DateOfBirth']")).sendKeys(value);
                break;
            case "firstName":
                driver.findElement(By.cssSelector("input[id='member_firstname']")).sendKeys(value);
                break;
            case "lastName":
                driver.findElement(By.cssSelector("input[id='member_lastname']")).sendKeys(value);
                break;
            case "email":
                driver.findElement(By.cssSelector("input[id='member_emailaddress']")).sendKeys(value);
                break;
            case "emailAgain":
                driver.findElement(By.cssSelector("input[id='member_confirmemailaddress']")).sendKeys(value);
                break;
            case "password":
                driver.findElement(By.cssSelector("input[id='signupunlicenced_password']")).sendKeys(value);
                break;
            case "passwordAgain":
                driver.findElement(By.cssSelector("input[id='signupunlicenced_confirmpassword']")).sendKeys(value);
                break;
            case "wrongPassword":
                driver.findElement(By.cssSelector("input[id='signupunlicenced_confirmpassword']")).sendKeys(value);
                break;
        }
    }

    @And("I have agreed to Terms and Conditions")
    public void iHaveAgreedToTerms() {
        click(driver, "label[for='sign_up_25']");
        click(driver, "label[for='sign_up_26']");
    }

    @And("I have agreed to the CoC")
    public void iHaveAgreedToCoC() {
        click(driver, "label[for='fanmembersignup_agreetocodeofethicsandconduct']");
    }

    @And("I press the confirm button")
    public void iPressTheConfirmButton() {
        click(driver, "input[type='submit']");
    }
    @Then("I should have signed up successfully")
    public void iShouldHaveSignedUpSuccessfully() {

        String expected = "THANK YOU FOR CREATING AN ACCOUNT WITH BASKETBALL ENGLAND";
        String actual = driver.findElement(By.cssSelector("h2[class='bold  gray  text-center  margin-bottom-40']")).getText();

        assertEquals(expected, actual);
    }
    @Then("An error should pop up regarding last name")
    public void anErrorShouldPopUpRegardingLastName() {
        String expected = "Last Name is required";
        String actual = driver.findElement(By.cssSelector("span[for='member_lastname']")).getText();
        assertEquals(expected, actual);
    }

    @Then("An error should pop up regarding passwords")
    public void anErrorShouldPopUpRegardingPasswords() {
        String expected = "Password did not match";
        String actual = driver.findElement(By.cssSelector("span[for='signupunlicenced_confirmpassword']")).getText();
        assertEquals(expected, actual);
    }

    @Then("An error should pop up regarding ToC")
    public void anErrorShouldPopUpRegardingToC() {
        String expected = "You must confirm that you have read and accepted our Terms and Conditions";
        String actual = driver.findElement(By.cssSelector("span[for='TermsAccept']")).getText();
        assertEquals(expected, actual);
    }

    @After public void tearDown(){
        driver.quit();
    }

    private void click(WebDriver driver, String selector) {


        (new WebDriverWait(driver, Duration.ofSeconds(5))).until((ExpectedConditions.


                elementToBeClickable(By.cssSelector(selector))));


        driver.findElement(By.cssSelector(selector)).click();
    }


}
