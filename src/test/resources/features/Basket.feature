Feature: Basketball

  Scenario Outline: Sign up as a member successfully
    Given I have selected <browser> as browser
    And I have navigated to <link>
    When I have entered "age" with value <age>
    And I have entered "firstName" with value <firstName>
    And I have entered "lastName" with value <lastName>
    And I have entered "email" with value <email>
    And I have entered "emailAgain" with value <emailAgain>
    And I have entered "password" with value <password>
    And I have entered "passwordAgain" with value <passwordAgain>
    And I have agreed to Terms and Conditions
    And I have agreed to the CoC
    Then I press the confirm button
    Examples:
      | browser   | link                                                             | age          | firstName | lastName  | email                | emailAgain           | password   | passwordAgain |
      | "chrome"  | "https://membership.basketballengland.co.uk/NewSupporterAccount" | "10/04/1990" | "Bodil"   | "Larsson" | "bodil4@larsson.com" | "bodil3@larsson.com" | "Bodil123" | "Bodil123"    |
      | "firefox" | "https://membership.basketballengland.co.uk/NewSupporterAccount" | "10/04/1990" | "Bodil"   | "Larsson" | "bodil4@larsson.com" | "bodil3@larsson.com" | "Bodil123" | "Bodil123"    |

  Scenario Outline: Sign up as a member without last name
    Given I have selected <browser> as browser
    And I have navigated to <link>
    When I have entered "age" with value <age>
    And I have entered "firstName" with value <firstName>
    And I have entered "email" with value <email>
    And I have entered "emailAgain" with value <emailAgain>
    And I have entered "password" with value <password>
    And I have entered "passwordAgain" with value <passwordAgain>
    And I have agreed to Terms and Conditions
    And I have agreed to the CoC
    And I press the confirm button
    Then An error should pop up regarding last name
    Examples:
      | browser   | link                                                             | age          | firstName |  | email                | emailAgain           | password   | passwordAgain |
      | "chrome"  | "https://membership.basketballengland.co.uk/NewSupporterAccount" | "10/04/1990" | "Bodil"   |  | "bodil3@larsson.com" | "bodil3@larsson.com" | "Bodil123" | "Bodil123"    |
      | "firefox" | "https://membership.basketballengland.co.uk/NewSupporterAccount" | "10/04/1990" | "Bodil"   |  | "bodil3@larsson.com" | "bodil3@larsson.com" | "Bodil123" | "Bodil123"    |

  Scenario Outline: Sign up as a member with non-matching passwords
    Given I have selected <browser> as browser
    And I have navigated to <link>
    When I have entered "age" with value <age>
    And I have entered "firstName" with value <firstName>
    And I have entered "lastName" with value <lastName>
    And I have entered "email" with value <email>
    And I have entered "emailAgain" with value <emailAgain>
    And I have entered "password" with value <password>
    And I have entered "wrongPassword" with value <wrongPassword>
    And I have agreed to Terms and Conditions
    And I have agreed to the CoC
    And I press the confirm button
    Then An error should pop up regarding passwords
    Examples:
      | browser   | link                                                             | age          | firstName | lastName  | email                | emailAgain           | password   | wrongPassword |
      | "chrome"  | "https://membership.basketballengland.co.uk/NewSupporterAccount" | "10/04/1990" | "Bodil"   | "Larsson" | "bodil3@larsson.com" | "bodil3@larsson.com" | "Bodil123" | "Bodil1234"   |
      | "firefox" | "https://membership.basketballengland.co.uk/NewSupporterAccount" | "10/04/1990" | "Bodil"   | "Larsson" | "bodil3@larsson.com" | "bodil3@larsson.com" | "Bodil123" | "Bodil1234"   |

  Scenario Outline: Sign up as a member without accepting Terms and Conditions
    Given I have selected <browser> as browser
    And I have navigated to <link>
    When I have entered "age" with value <age>
    And I have entered "firstName" with value <firstName>
    And I have entered "lastName" with value <lastName>
    And I have entered "email" with value <email>
    And I have entered "emailAgain" with value <emailAgain>
    And I have entered "password" with value <password>
    And I have entered "passwordAgain" with value <passwordAgain>
    And I have agreed to the CoC
    And I press the confirm button
    Then An error should pop up regarding ToC
    Examples:
      | browser   | link                                                             | age          | firstName | lastName  | email                | emailAgain           | password   | passwordAgain |
      | "chrome"  | "https://membership.basketballengland.co.uk/NewSupporterAccount" | "10/04/1990" | "Bodil"   | "Larsson" | "bodil3@larsson.com" | "bodil3@larsson.com" | "Bodil123" | "Bodil123"    |
      | "firefox" | "https://membership.basketballengland.co.uk/NewSupporterAccount" | "10/04/1990" | "Bodil"   | "Larsson" | "bodil3@larsson.com" | "bodil3@larsson.com" | "Bodil123" | "Bodil123"    |

