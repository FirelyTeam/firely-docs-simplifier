.. _accessibility:

Accessibility
=============

Firely Accessibility Conformance Report - WCAG Edition
------------------------------------------------------

(Based on VPAT® Version 2.5)

**Name of Product/Version:** Simplifier.net  

**Report Date:** 25-09-2024

**Product Description:** Simplifier.net by Firely is an online platform for collaborating
and publishing the artifacts from FHIR specifications.

**Contact Information:** Please contact simplifier@fire.ly with any questions or suggestions
for improvements.

Notes
~~~~~

General notes

* Simplifier.net is a platform for user-generated content. While we do our best to facilitate
  our users in creating accessible content, the flexibility of the platform requires users to
  check their own generated content for accessibility.

* The tree rendering of FHIR resources can be navigated by keyboard when Javascript is enabled:
  
  - Tab until the full tree is selected.
  - Then navigate the three rows with the up and down arrows. When using a screen reader this
    can be done after 'Scan mode' is turned off.
  - Tree nodes can be opened/collapsed by selecting the node and pressing Space bar or Enter.

  The Details page on a resource and dictionary rendering in an Implementation Guide provide
  static alternatives.

* The Monaco Editor which is embedded in many places on the site provides powerful accessibility
  features and a dedicated menu which is highlighted when using a screen reader. More information
  can be found in the `Monaco Editor Accessibility Guide <https://github.com/microsoft/monaco-editor/wiki/Monaco-Editor-Accessibility-Guide>`_.

Changelog

* Nov 30, 2020: First edition published.
* Dec 22, 2020: Accessibility scan completed and major issues resolved.
* Sep 25, 2024: Second edition published.

Evaluation Methods Used
~~~~~~~~~~~~~~~~~~~~~~~

* Testing based on general product knowledge
* Testing with assistive technologies with Google Chrome/Microsoft Edge on Windows

   * `WAVE Web Accessibility Evaluation Tool`_

   * `Microsoft Narrator`_

Applicable Standards/Guidelines
-------------------------------

This report covers the degree of conformance for the following
accessibility standard/guidelines:

.. list-table::
  :widths: 10 10
  :header-rows: 1

  * - Standard/Guideline
    - Included In Report

  * - `Web Content Accessibility Guidelines 2.0`_
    - Level A: Yes
      
      Level AA: Yes
      
      Level AAA: No

  * - `Web Content Accessibility Guidelines 2.1`_
    - Level A: Yes
      
      Level AA: Yes
      
      Level AAA: No
  
  * - `Web Content Accessibility Guidelines 2.2`_
    - Level A: Yes
      
      Level AA: Yes
      
      Level AAA: No  

Terms
-----

The terms used in the Conformance Level information are defined as
follows:

-  **Supports** : The functionality of the product has at least one
   method that meets the criterion without known defects or meets with
   equivalent facilitation.
-  **Partially Supports** : Some functionality of the product does not
   meet the criterion.
-  **Does Not Support** : The majority of product functionality does not
   meet the criterion.
-  **Not Applicable** : The criterion is not relevant to the product.
-  **Not Evaluated** : The product has not been evaluated against the
   criterion. This can be used only in WCAG 2.0 Level AAA.


Scope
------

Tests were executed with the following pages, taken as representative for the full application:

.. list-table::
  :widths: 10 10 10
  :header-rows: 1

  * - Id
    - Web Page / Screen / Document Identifier
    - Location / URL
  * - 1
    - Implementation Guide
    - https://simplifier.net/guide/accessibilitytestingimplementationguide
  * - 1.1
    - * Home page and navigation
    - https://simplifier.net/guide/AccessibilitytestingImplementationGuide/Home
  * - 1.2
    - * Static Markdown pages
    - https://simplifier.net/guide/accessibilitytestingimplementationguide/staticmarkdownpage
  * - 1.3
    - * Page with an embedded resource
    - https://simplifier.net/guide/accessibilitytestingimplementationguide/pagewithanembeddedresource
  * - 2
    - Resource page
    - https://simplifier.net/Accessibilitytestingproject/ACMEbasePatient
  * - 2.1
    - * Page with tree view
    - https://simplifier.net/Accessibilitytestingproject/ACMEbasePatient/~overview
  * - 3
    - Home page
    - https://simplifier.net/
  * - 4
    - Organization page
    - https://simplifier.net/organization/firely
  * - 5
    - Project page
    - https://simplifier.net/accessibilitytestingproject
  * - 6
    - Package page
    - https://simplifier.net/packages/firely.com.accessibilitytesting/0.0.1-test/~introduction
  * - 7
    - Validation page
    - https://simplifier.net/snippet/wardweistra/18/$validate
  * - 8
    - Search page
    - https://simplifier.net/search
  * - 9
    - Snippet page
    - https://simplifier.net/snippet/wardweistra/18
  * - 10
    - Documentation page
    - https://docs.fire.ly/simplifier/index.html
  * - 11
    - Sign up page
    - https://simplifier.net/signup
  * - 12
    - Upload file page
    - https://simplifier.net/accessibilitytestingproject/upload
  * - 13
    - Upload snippet page
    - https://simplifier.net/snippet
  * - 14
    - Jurisdiction page
    - https://simplifier.net/jurisdictions/nl
  * - 15
    - News page
    - https://simplifier.net/organization/firely/news/158
  
   

WCAG 2.x Report
---------------

Note: When reporting on conformance with the WCAG 2.x Success Criteria,
they are scoped for full pages, complete processes, and
accessibility-supported ways of using technology as documented in the
`WCAG 2.2 Conformance Requirements`_.

Table 1: Success Criteria, Level A
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. list-table::
  :widths: 10 10 10
  :header-rows: 1

  * - Criteria
    - Conformance Level
    - Remarks and Explanations

  * - `1.1.1 Non-text Content`_
      
      (Level A)
    - Partially supports
    - Known issues
      
       * [SIM-4057] Alt text missing for image in homepage
       * [SIM-4058] Alt text missing for Avatars in news section in Organization home page
       * [SIM-4053] Alt text missing for images in news pages
       * [SIM-4048] Multiple accessibility issues with Captcha-image in Sign up page
       * [SIM-4080] Missing alternative text in multiple test pages
  
  * - `1.2.1 Audio-only and Video-only`_
      
      (Level A)
    - Supports
    - No pre recorded audio. Video from youtube.com contains subtitles that is a text alternative.

  * - `1.2.2 Captions`_
      
      (Level A)
    - Supports
    - Video from youtube.com contains subtitles.

  * - `1.2.3 Audio Description or Media Alternative`_
      
      (Level A)
    - Supports
    - Video from youtube.com contains subtitles.

  * - `1.3.1 Info and Relationships`_
      
      (Level A)
    - Partially Supports
    - Known issues
      
       * [SIM-4077] Broken ARIA reference in multiple test pages
       * [SIM-4072] Empty Table header in multiple test pages

  * - `1.3.2 Meaningful Sequence`_
      
      (Level A)
    - Supports
    - Meaningful order of elements is reflected in programmatic page structure.

  * - `1.3.3 Sensory Characteristics`_
      
      (Level A)
    - Supports
    - Instructions provided for understanding and operating content do not rely solely on sensory characteristics
      of components such as shape, size, visual location, orientation, or sound.

  * - `1.4.1 Use of Color`_
  
      (Level A)
    - Supports
    - Color is not used as the only visual means of conveying information, indicating an action, prompting a
      response, or distinguishing a visual element.

  * - `1.4.2 Audio Control`_
  
      (Level A)
    - Supports
    - Audio of videos from youtube.com can be controlled 

  * - `2.1.1 Keyboard`_
  
      (Level A)
    - Partially Supports
    - For keyboard navigation in the FHIR resource tree and the embedded Monaco code editors, see general notes above.

      Known issues

       * [SIM-1382] Edit button for canonical base URLs on project not accessible with keyboard only
       * [SIM-1384] Can't activate the check marks on the Create a new package page

  * - `2.1.2 No Keyboard Trap`_
  
      (Level A)
    - Partially Supports
    - On tab trapping in the embedded Monaco code editors, see general note above.

      Known issues

       * [SIM-1378] keyboard trap: create issue on project / add comment on issue
       * [SIM-1381] keyboard trap: create script connector

  * - `2.1.4 Character Key Shortcuts`_
  
      (Level A 2.1 only)
    - Supports
    - No keyboard shortcuts are used, except in Monaco code editor, which provides its own accessibility menu and options.

  * - `2.2.1 Timing Adjustable`_
  
      (Level A)
    - Supports
    - No timings are used.

  * - `2.2.2 Pause, Stop, Hide`_
      
      (Level A)
    - Supports
    - All scrolling, moving content (for example the log output from file import or package generation)
      are started based on user input and pause at the end for review.

  * - `2.3.1 Three Flashes or Below Threshold`_
      
      (Level A)
    - Supports
    - No flashing content is used.

  * - `2.4.1 Bypass Blocks`_
      
      (Level A)
    - Supports
    - Known issues
    
       * [SIM-4054] Contact Sales Button and contact button is not easily accessible through Keyboard
      

  * - `2.4.2 Page Titled`_
      
      (Level A)
    - Supports
    - Known issues

       * [SIM-1367] Consider using different page title per resource/project/package tab

  * - `2.4.3 Focus Order`_
      
      (Level A)
    - Supports
    - Known issues

       * [SIM-1476] Keyboard navigation order in file management page is incorrect

  * - `2.4.4 Link Purpose (In Context)`_
      
      (Level A)
    - Partially Supports
    - Known issues:
    
       * [SIM-4081] Empty link in snippet page
       * [SIM-4079] Empty button in multiple test pages


  * - `2.5.1 Pointer Gestures`_
      
      (Level A 2.1 only)
    - Partially Supports
    - Known issues:
    
       * [SIM-1371] Drag and drop for page reordering in IG editor has no keyboard/button alternative
       * [SIM-1387] Unable to succesfully navigate account avatar with keyboard only

  * - `2.5.2 Pointer Cancellation`_
      
      (Level A 2.1 only)
    - Supports
    - No actions are executed on mouse down event.

  * - `2.5.3 Label in Name`_
      
      (Level A 2.1 only)
    - Partially Supports
    - Known issues:
    
       * [SIM-4078] Missing form label in multiple test pages

  * - `2.5.4 Motion Actuation`_
      
      (Level A 2.1 only)
    - Supports
    - No motion is used.

  * - `3.1.1 Language of Page`_
      
      (Level A)
    - Supports
    - The default human language is identified by the lang attribute on the html element.

  * - `3.2.1 On Focus`_
      
      (Level A)
    - Supports
    - No change of context is executed when changing focus.

  * - `3.2.2 On Input`_
      
      (Level A)
    - Supports
    - No change of context is executed when changing input, without user actuation.

  * - `3.2.6 Consistent Help`_
      
      (Level A 2.2 only)
    - Supports
    - Feedback button exists at the top navigation bar on every page and on entering the details, a support person can get in touch with the user.

  * - `3.3.7 Redundant Entry`_
      
      (Level  2.2 only)
    - Supports
    - Redundant information is not asked in any pages.
      Exception is only in Change Password page and this exception is allowed as per Success criteria.

  * - `3.3.1 Error Identification`_
      
      (Level A)
    - Partially Supports
    - Known issues
      
       * [SIM-1373] Error message on deleting team with packages/project linked is time based
       * [SIM-1413] Incorrect URL message on Account settings page is time based
       * Confirmation of copied canonical or resource is time based popup

  * - `3.3.2 Labels or Instructions`_
      
      (Level A)
    - Partially Supports
    - Known issues:
    
       * [SIM-4078] Missing form label in multiple test pages

  * - `4.1.1 Parsing`_
      
      (Level A)
    - Partially Supports
    - Known issues

       * [SIM-1389] Tree rendering HTML errors
      
  * - `4.1.2 Name, Role, Value`_
      
      (Level A)
    - Partially Supports
    - Known issues
    
       * [SIM-1384] Check boxes on package creation third tab are not tab accessible.


Table 2: Success Criteria, Level AA
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. list-table::
  :widths: 10 10 10
  :header-rows: 1

  * - Criteria
    - Conformance Level
    - Remarks and Explanations

  * - `1.2.4 Captions (Live)`_
    
      (Level AA)
    - Supports
    - No (live) audio used.

  * - `1.2.5 Audio Description (Prerecorded)`_
    
      (Level AA)
    - Supports
    - Videos from youtube.com have subtitles that can be used as audio description.

  * - `1.3.4 Orientation`_
    
      (Level AA 2.1 only)
    - Supports
    - Site does not fixate a particular screen orientation.

  * - `1.3.5 Identify Input Purpose`_
    
      (Level AA 2.1 only)
    - Partially Supports
    - Known issues
    
       * [SIM-1376] Use standard input type on Signup, Login and Account Settings (eg type=name)

  * - `1.4.3 Contrast (Minimum)`_
    
      (Level AA)
    - Partially Supports
    - On contrast in the embedded Monaco code editors, see general note above.
      
      Contrast issues in website main content will be addressed in upcoming change of website colors.
    
  * - `1.4.4 Resize text`_
    
      (Level AA)
    - Supports
    - No loss of function at 200% zoom level.

  * - `1.4.5 Images of Text`_
    
      (Level AA)
    - Supports
    - No images of text are used.

  * - `1.4.10 Reflow`_
    
      (Level AA 2.1 only)
    - Supports
    - Even in small view ports website reflows and content is still accessible.

  * - `1.4.11 Non-text Contrast`_
    
      (Level AA 2.1 only)
    - Supports
    - Images not used as replacement for user interface components or for required understanding.

  * - `1.4.12 Text Spacing`_
    
      (Level AA 2.1 only)
    - Supports
    - No loss of function found with large fonts, line height and spacing.

  * - `1.4.13 Content on Hover or Focus`_
    
      (Level AA 2.1 only)
    - Supports
    - Note: For seeing the content that appears in the resource tree-rendering on mouse over,
      click the element to make it persistent and not disappear on removal of mouse focus.

  * - `2.4.5 Multiple Ways`_
    
      (Level AA)
    - Supports
    - All user content on Simplifier.net is reachable via Search and direct navigation via owning organization/project/packages.
      
      Implementation Guides have support for providing a Table of Contents of all pages.

  * - `2.4.6 Headings and Labels`_
    
      (Level AA)
    - Partially Supports
    - Known issues
    
       * [SIM-4078] Missing form label in multiple test pages
  
  * - `2.4.7 Focus Visible`_
    
      (Level AA)
    - Supports
    - When a user interface component receives keyboard focus, the component is not entirely hidden due to author-created content.

  * - `2.4.11 Focus Not Obscured (Minimum)`_
    
      (Level AA 2.2 only)
    - Partially Supports
    - Known issues
    
       * [SIM-4063] Delete confirmation box is hidden by the Completed successfully overlay

  * - `2.5.7 Dragging Movements`_
    
      (Level AA 2.2 only)
    - Partially Supports
    - Known Issues:

       * [SIM-4048] Captcha-image in Sign up page cannot be accessed with a keyboard/ completely relies on mouse drag
       * [SIM-1371] Drag and drop for page reordering in IG editor has no keyboard/button alternative
      
  * - `2.5.8 Target Size (Minimum)`_
    
      (Level AA 2.2 only)
    - Supports
    - 

  * - `3.1.2 Language of Parts`_
    
      (Level AA)
    - Supports
    - Website is only provided in English, which is indicated as page language.

      Note: User defined text currently has no way to deviate from English language. This will be done later when support for IG translation is added.

  * - `3.2.3 Consistent Navigation`_
    
      (Level AA)
    - Supports
    - The menu is provided consistently throughout the site. Exceptions:

      * Full page editors that open in new window: Differential in resource history, Update resource in standalone editor, Implementation Guide editor.
      * Implementation guides have a navigation defined by the style chosen by the publishing user.

  * - `3.2.4 Consistent Identification`_
    
      (Level AA)
    - Supports
    - Components that have the same functionality within a set of Web pages are identified consistently.

  * - `3.3.3 Error Suggestion`_
    
      (Level AA)
    - Supports
    - Where solutions to possible errors are known the site tries to prevent you from making them beforehand.
      Examples: Providing dropdowns of possible values or automatically fixing duplicate URLs.

  * - `3.3.4 Error Prevention (Legal, Financial, Data)`_
    
      (Level AA)
    - Supports
    - No financial transactions, legal transactions or test results are handled.
      All data delete operations require an extra confirmation step.

  * - `3.3.8 Accessible Authentication (Minimum)`_
    
      (Level AA 2.2 only)
    - Supports
    - Sign up page displays an object that needs to be dragged into a position to solve the puzzle and a mechanism exists with instructions to assist the user.

  * - `4.1.3 Status Messages`_
    
      (Level AA 2.1 only)
    - Supports
    - There where status is conveyed by graphical elements, like a progress bar, the status is programmatically available to the user agent.

.. _Web Content Accessibility Guidelines 2.0: http://www.w3.org/TR/2008/REC-WCAG20-20081211
.. _Web Content Accessibility Guidelines 2.1: https://www.w3.org/TR/WCAG21
.. _Web Content Accessibility Guidelines 2.2: https://www.w3.org/TR/WCAG22
.. _WCAG 2.2 Conformance Requirements: https://www.w3.org/TR/WCAG22/#conformance-to-wcag-2-2

.. _WAVE Web Accessibility Evaluation Tool: https://wave.webaim.org/
.. _Microsoft Narrator: https://support.microsoft.com/en-us/windows/complete-guide-to-narrator-e4397a0d-ef4f-b386-d8ae-c172f109bdb1

.. _1.1.1 Non-text Content: http://www.w3.org/TR/WCAG20/#text-equiv-all
.. _1.2.1 Audio-only and Video-only: http://www.w3.org/TR/WCAG20/#media-equiv-av-only-alt
.. _1.2.2 Captions: http://www.w3.org/TR/WCAG20/#media-equiv-captions
.. _1.2.3 Audio Description or Media Alternative: http://www.w3.org/TR/WCAG20/#media-equiv-audio-desc
.. _1.3.1 Info and Relationships: http://www.w3.org/TR/WCAG20/#content-structure-separation-programmatic
.. _1.3.2 Meaningful Sequence: http://www.w3.org/TR/WCAG20/#content-structure-separation-sequence
.. _1.3.3 Sensory Characteristics: http://www.w3.org/TR/WCAG20/#content-structure-separation-understanding
.. _1.4.1 Use of Color: http://www.w3.org/TR/WCAG20/#visual-audio-contrast-without-color
.. _1.4.2 Audio Control: http://www.w3.org/TR/WCAG20/#visual-audio-contrast-dis-audio
.. _2.1.1 Keyboard: http://www.w3.org/TR/WCAG20/#keyboard-operation-keyboard-operable
.. _2.1.2 No Keyboard Trap: http://www.w3.org/TR/WCAG20/#keyboard-operation-trapping
.. _2.1.4 Character Key Shortcuts: https://www.w3.org/TR/WCAG21/#character-key-shortcuts
.. _2.2.1 Timing Adjustable: http://www.w3.org/TR/WCAG20/#time-limits-required-behaviors
.. _2.2.2 Pause, Stop, Hide: http://www.w3.org/TR/WCAG20/#time-limits-pause
.. _2.3.1 Three Flashes or Below Threshold: http://www.w3.org/TR/WCAG20/#seizure-does-not-violate
.. _2.4.1 Bypass Blocks: http://www.w3.org/TR/WCAG20/#navigation-mechanisms-skip
.. _2.4.2 Page Titled: http://www.w3.org/TR/WCAG20/#navigation-mechanisms-title
.. _2.4.3 Focus Order: http://www.w3.org/TR/WCAG20/#navigation-mechanisms-focus-order
.. _2.4.4 Link Purpose (In Context): http://www.w3.org/TR/WCAG20/#navigation-mechanisms-refs
.. _2.5.1 Pointer Gestures: https://www.w3.org/TR/WCAG21/#pointer-gestures
.. _2.5.2 Pointer Cancellation: https://www.w3.org/TR/WCAG21/#pointer-cancellation
.. _2.5.3 Label in Name: https://www.w3.org/TR/WCAG21/#label-in-name
.. _2.5.4 Motion Actuation: https://www.w3.org/TR/WCAG21/#motion-actuation
.. _3.1.1 Language of Page: http://www.w3.org/TR/WCAG20/#meaning-doc-lang-id
.. _3.2.1 On Focus: http://www.w3.org/TR/WCAG20/#consistent-behavior-receive-focus
.. _3.2.2 On Input: http://www.w3.org/TR/WCAG20/#consistent-behavior-unpredictable-change
.. _3.2.6 Consistent Help: https://www.w3.org/TR/WCAG22/#consistent-help
.. _3.3.7 Redundant Entry: https://www.w3.org/TR/WCAG22/#redundant-entry
.. _3.3.1 Error Identification: http://www.w3.org/TR/WCAG20/#minimize-error-identified
.. _3.3.2 Labels or Instructions: http://www.w3.org/TR/WCAG20/#minimize-error-cues
.. _4.1.1 Parsing: http://www.w3.org/TR/WCAG20/#ensure-compat-parses
.. _4.1.2 Name, Role, Value: http://www.w3.org/TR/WCAG20/#ensure-compat-rsv

.. _1.2.4 Captions (Live): http://www.w3.org/TR/WCAG20/#media-equiv-real-time-captions
.. _1.2.5 Audio Description (Prerecorded): http://www.w3.org/TR/WCAG20/#media-equiv-audio-desc-only
.. _1.3.4 Orientation: https://www.w3.org/TR/WCAG21/#orientation
.. _1.3.5 Identify Input Purpose: https://www.w3.org/TR/WCAG21/#identify-input-purpose
.. _1.4.3 Contrast (Minimum): http://www.w3.org/TR/WCAG20/#visual-audio-contrast-contrast
.. _1.4.4 Resize text: http://www.w3.org/TR/WCAG20/#visual-audio-contrast-scale
.. _1.4.5 Images of Text: http://www.w3.org/TR/WCAG20/#visual-audio-contrast-text-presentation
.. _1.4.10 Reflow: https://www.w3.org/TR/WCAG21/#reflow
.. _1.4.11 Non-text Contrast: https://www.w3.org/TR/WCAG21/#non-text-contrast
.. _1.4.12 Text Spacing: https://www.w3.org/TR/WCAG21/#text-spacing
.. _1.4.13 Content on Hover or Focus: https://www.w3.org/TR/WCAG21/#content-on-hover-or-focus
.. _2.4.5 Multiple Ways: http://www.w3.org/TR/WCAG20/#navigation-mechanisms-mult-loc
.. _2.4.6 Headings and Labels: http://www.w3.org/TR/WCAG20/#navigation-mechanisms-descriptive
.. _2.4.7 Focus Visible: http://www.w3.org/TR/WCAG20/#navigation-mechanisms-focus-visible
.. _2.4.11 Focus Not Obscured (Minimum): https://www.w3.org/TR/WCAG22/#focus-not-obscured-minimum
.. _2.5.7 Dragging Movements: https://www.w3.org/TR/WCAG22/#dragging-movements
.. _2.5.8 Target Size (Minimum): https://www.w3.org/TR/WCAG22/#target-size-minimum
.. _3.1.2 Language of Parts: http://www.w3.org/TR/WCAG20/#meaning-other-lang-id
.. _3.2.3 Consistent Navigation: http://www.w3.org/TR/WCAG20/#consistent-behavior-consistent-locations
.. _3.2.4 Consistent Identification: http://www.w3.org/TR/WCAG20/#consistent-behavior-consistent-functionality
.. _3.3.3 Error Suggestion: http://www.w3.org/TR/WCAG20/#minimize-error-suggestions
.. _3.3.4 Error Prevention (Legal, Financial, Data): http://www.w3.org/TR/WCAG20/#minimize-error-reversible
.. _3.3.8 Accessible Authentication (Minimum): https://www.w3.org/TR/WCAG22/#accessible-authentication-minimum
.. _4.1.3 Status Messages: https://www.w3.org/TR/WCAG21/#status-messages

.. _2.4.12 Focus Not Obscured (Enhanced): https://www.w3.org/TR/WCAG22/#focus-not-obscured-enhanced
.. _2.4.13 Focus Appearance: https://www.w3.org/TR/WCAG22/#focus-appearance
.. _3.3.9 Accessible Authentication (Enhanced): https://www.w3.org/TR/WCAG22/#accessible-authentication-enhanced
