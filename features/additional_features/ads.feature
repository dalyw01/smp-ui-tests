@ads
Feature: Checking SMP Ads work for various types of ads

    As a tester of SMP
    I want to check Ads work with SMP
    So that I verify SMP works during and after an Ad plays
    The different types of Ads are

    - Post roll ads
    - Skippable ads

    @pre_roll_ads
    Scenario Outline: Check pre roll ads work and SMP works after ad has finished.
    If replaying content, ad should not show.

    Given I visit "<page>" with a "<type>" player on "<device>"
    When the COOKBOOK has loaded
    And I click ADS CTA to begin playback
    And I can see AD controlbar
    And I can AD pause
    And I can see AD controlbar
    And I can AD play
    And I can wait for AD to finish
    And I see controlbar hides instantly if "<type>"
    And I can pause
    And I can play
    And I can mute
    And I can click each volume bar
    And I can unmute
    And I see controlbar hides instantly if "<type>"
    And I can seek in quarters to the end
    And I click CTA to begin playback
    And I can pause

    Examples:
    | page                 | type  | device  |
    | https://is.gd/bezeye | video | desktop |
    | https://is.gd/ukewad | audio | desktop |

    # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

    @skippable_ad
    Scenario Outline: Check skippable ad show, can be clicked and SMP works after ad has finished.
    If replaying content, ad should not show.

    Given I visit "<page>" with a "<type>" player on "<device>"
    When the COOKBOOK has loaded
    And I load skippable ads by clicking html button
    And I click ADS CTA to begin playback
    And I can see AD controlbar
    And I can AD pause
    And I enter AD fullscreen if "<mode>"
    And I can see AD controlbar
    And I can AD play
    And I can click Skip Add option
    And I see controlbar hides instantly if "<type>"
    And I can pause
    And I can play
    And I can seek in quarters to the end

    Examples:
    | page                 | type   | device  | mode       |
    | https://is.gd/bezeye | video  | desktop | Inline     |
    | https://is.gd/bezeye | video  | desktop | Fullscreen |
    | https://is.gd/ukewad | audio  | desktop | Inline     |

    # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

    @NoAdsWhenReplay
    Scenario Outline: Check No AD appear while replaying the content

    Given I visit "<page>" with a "<type>" player on "<device>"
    When the COOKBOOK has loaded
    And I load skippable ads by clicking html button
    And I click ADS CTA to begin playback
    And I can see AD controlbar
    And I seek to end of programme
    Then I can find no ADS when I replay the content

    Examples:
    | page                 | type   | device  | mode       |
    | https://is.gd/bezeye | video  | desktop | Inline     |
    | https://is.gd/bezeye | video  | desktop | Fullscreen |
    | https://is.gd/ukewad | audio  | desktop | Inline     |
