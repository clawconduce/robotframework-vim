"=============================================================================
" File:         after/syntax/robot.vim
" Author:       Michael Foukarakis
" Version:      0.2
" Created:      Fri 17 Dec 2010 11:31:46 AM EET
" Last Update:  Tue 28 Jul 2015 15:39:21 AM CEST
"------------------------------------------------------------------------
" Description:
"       Syntax file for Robot test framework files.
"------------------------------------------------------------------------
" Installation:
"       Drop this file into {rtp}/after/syntax
"       Requires Vim 7+
" History:
"       0.1 - Robot now has a standard library, containing all sorts of goodies.
"       0.2 - Add all built-in, ssh and selenium library keywords.
"             Fix to match longest pattern instead of the first one.
" TODO:
"       * Figure out a neater alternative for the monster path regex
"=============================================================================
let s:cpo_save=&cpo
set cpo&vim
"------------------------------------------------------------------------
" Matches
"------------------------------------------------------------------------
syn match robotNumber               display "\<\d\+\>"
syn match robotEllipsis             display "\.\.\."
" Special (escaped) character as defined in Robot's syntax.
syn match robotSpecial              display "\\\(\${.*}\|\\\|#\|[n|r|t]\)"
" As variables may be used next to each other, do a non-greedy match.
" Alternatively, match only alphanumeric chars inside brackets.
syn match robotVariable             "\(\$\|@\){.\{-}}"
" This is by far the most stupid regex you'll see in here..
syn match robotPath                 display "\(\.\{1,2}\/\)\=\(\(\h\|\d\)\+\/\)\+\(\(\h\|\d\)\+\.\h\+\)\{,1}$"
" Operators
syn match robotOperator             "==\|="
" Table headers
syn match robotTable                "\c^\(\*\+\)\s*\(settings\|variables\|test cases\|\(user \)\?keywords\)\s*\1$"
" Common settings
syn match robotCommonSet            "\c\[\(Documentation\|Timeout\)\]"
" Keyword settings
syn match robotKeywordSet           "\c\[\(Arguments\|Return\)\]"
" Testcase settings
syn match robotTestcaseSet          "\c\[\(Tags\|Setup\|Teardown\|Precondition\|Postcondition\|Template\)\]"

" Robot Gherkin support
syn match robotGherkin              "\c\<\(Given\|When\|Then\|And\|But\)\>"

" Settings (global)
syn match robotSetup                "\c\<\(Suite\|Test\) \(Setup\|Teardown\|Precondition\|Postcondition\)\>"
syn match robotSettings             "\c\<\(Library\|Resource\|Variables\|Documentation\|Metadata\|Force[ _]Tags\|Default[ _]Tags\|Test[ _]Template\|Test[ _]Timeout\)\>"

" Standard libraries
" List variables in reverse order to match the longest pattern not the first one.
syn match collectionsLibrary        "\c\<\(Sort List\|Should[ _]Not[ _]Contain[ _]Match\|Should[ _]Contain[ _]Match\|Set[ _]To[ _]Dictionary\|Set[ _]List[ _]Value\|Reverse[ _]List\|Remove[ _]Values[ _]From[ _]List\|Remove[ _]From[ _]List\|Remove[ _]From[ _]Dictionary\|Remove[ _]Duplicates\|Log[ _]List\|Log[ _]Dictionary\|Lists[ _]Should[ _]Be[ _]Equal\|List[ _]Should[ _]Not[ _]Contain[ _]Value\|List[ _]Should[ _]Not[ _]Contain[ _]Duplicates\|List[ _]Should[ _]Contain[ _]Value\|List[ _]Should[ _]Contain[ _]Sub[ _]List\|Keep[ _]In[ _]Dictionary\|Insert[ _]Into[ _]List\|Get[ _]Slice[ _]From[ _]List\|Get[ _]Matches\|Get[ _]Match[ _]Count\|Get[ _]Index[ _]From[ _]List\|Get[ _]From[ _]List\|Get[ _]From[ _]Dictionary\|Get[ _]Dictionary[ _]Values\|Get[ _]Dictionary[ _]Keys\|Get[ _]Dictionary[ _]Items\|Dictionary[ _]Should[ _]Not[ _]Contain[ _]Value\|Dictionary[ _]Should[ _]Not[ _]Contain[ _]Key\|Dictionary[ _]Should[ _]Contain[ _]Value\|Dictionary[ _]Should[ _]Contain[ _]Sub[ _]Dictionary\|Dictionary[ _]Should[ _]Contain[ _]Key\|Dictionary[ _]Should[ _]Contain[ _]Item\|Dictionaries[ _]Should[ _]Be[ _]Equal\|Create[ _]Dictionary\|Count[ _]Values[ _]In[ _]List\|Copy[ _]List\|Copy[ _]Dictionary\|Convert[ _]To[ _]List\|Combine[ _]Lists\|Append[ _]To[ _]List\)\>"
syn match dateTimeLibrary           "\c\<\(Subtract Time[ _]From[ _]Time\|Subtract[ _]Time[ _]From[ _]Date\|Subtract[ _]Date[ _]From[ _]Date\|Get[ _]Current[ _]Date\|Convert[ _]Time\|Convert[ _]Date\|Add[ _]Time[ _]To[ _]Time\|Add[ _]Time[ _]To[ _]Date\)\>"
syn match dialogLibrary             "\c\<\(Pause Execution\|Get[ _]Value[ _]From[ _]User\|Get[ _]Selection[ _]From[ _]User\|Execute[ _]Manual[ _]Step\)\>"
syn match operatingSystemLibrary    "\c\<\(Wait Until Removed\|Wait[ _]Until[ _]Created\|Touch\|Switch[ _]Process\|Stop[ _]Process\|Stop[ _]All[ _]Processes\|Start[ _]Process\|Split[ _]Path\|Split[ _]Extension\|Should[ _]Not[ _]Exist\|Should[ _]Exist\|Set[ _]Modified[ _]Time\|Set[ _]Environment[ _]Variable\|Run[ _]And[ _]Return[ _]Rc[ _]And[ _]Output\|Run[ _]And[ _]Return[ _]Rc\|Run\|Remove[ _]Files\|Remove[ _]File\|Remove[ _]Environment[ _]Variable\|Remove[ _]Directory\|Read[ _]Process[ _]Output\|Normalize[ _]Path\|Move[ _]Files\|Move[ _]File\|Move[ _]Directory\|Log[ _]File\|Log[ _]Environment[ _]Variables\|List[ _]Files[ _]In[ _]Directory\|List[ _]Directory\|List[ _]Directories[ _]In[ _]Directory\|Join[ _]Paths\|Join[ _]Path\|Grep[ _]File\|Get[ _]Modified[ _]Time\|Get[ _]File[ _]Size\|Get[ _]File\|Get[ _]Environment[ _]Variables\|Get[ _]Environment[ _]Variable\|Get[ _]Binary[ _]File\|File[ _]Should[ _]Not[ _]Exist\|File[ _]Should[ _]Not[ _]Be[ _]Empty\|File[ _]Should[ _]Exist\|File[ _]Should[ _]Be[ _]Empty\|Environment[ _]Variable[ _]Should[ _]Not[ _]Be[ _]Set\|Environment[ _]Variable[ _]Should[ _]Be[ _]Set\|Empty[ _]Directory\|Directory[ _]Should[ _]Not[ _]Exist\|Directory[ _]Should[ _]Not[ _]Be[ _]Empty\|Directory[ _]Should[ _]Exist\|Directory[ _]Should[ _]Be[ _]Empty\|Create[ _]File\|Create[ _]Directory\|Create[ _]Binary[ _]File\|Count[ _]Items[ _]In[ _]Directory\|Count[ _]Files[ _]In[ _]Directory\|Count[ _]Directories[ _]In[ _]Directory\|Copy[ _]Files\|Copy[ _]File\|Copy[ _]Directory\|Append[ _]To[ _]File\|Append[ _]To[ _]Environment[ _]Variable\)\>"
syn match processLibrary            "\c\<\(Wait For[ _]Process\|Terminate[ _]Process\|Terminate[ _]All[ _]Processes\|Switch[ _]Process\|Start[ _]Process\|Send[ _]Signal[ _]To[ _]Process\|Run[ _]Process\|Process[ _]Should[ _]Be[ _]Stopped\|Process[ _]Should[ _]Be[ _]Running\|Is[ _]Process[ _]Running\|Get[ _]Process[ _]Result\|Get[ _]Process[ _]Object\|Get[ _]Process[ _]Id\)\>"
syn match screenshotLibrary         "\c\<\(Take[ _]Screenshot[ _]Without[ _]Embedding\|Take[ _]Screenshot\|Set[ _]Screenshot[ _]Directory\)\>"
syn match stringLibrary             "\c\<\(Split[ _]To[ _]Lines\|Split[ _]String[ _]To[ _]Characters\|Split[ _]String[ _]From[ _]Right\|Split[ _]String\|Should[ _]Not[ _]Be[ _]String\|Should[ _]Be[ _]Uppercase\|Should[ _]Be[ _]Unicode[ _]String\|Should[ _]Be[ _]Titlecase\|Should[ _]Be[ _]String\|Should[ _]Be[ _]Lowercase\|Should[ _]Be[ _]Byte[ _]String\|Replace[ _]String[ _]Using[ _]Regexp\|Replace[ _]String\|Remove[ _]String[ _]Using[ _]Regexp\|Remove[ _]String\|Get[ _]Substring\|Get[ _]Lines[ _]Matching[ _]Regexp\|Get[ _]Lines[ _]Matching[ _]Pattern\|Get[ _]Lines[ _]Containing[ _]String\|Get[ _]Line[ _]Count\|Get[ _]Line\|Generate[ _]Random[ _]String\|Fetch[ _]From[ _]Right\|Fetch[ _]From[ _]Left\|Encode[ _]String[ _]To[ _]Bytes\|Decode[ _]Bytes[ _]To[ _]String\|Convert[ _]To[ _]Uppercase\|Convert[ _]To[ _]Lowercase\)\>"
syn match telnetLibrary             "\c\<\(Write[ _]Until[ _]Expected[ _]Output\|Write[ _]Control[ _]Character\|Write[ _]Bare\|Write\|Switch[ _]Connection\|Set[ _]Timeout\|Set[ _]Telnetlib[ _]Log[ _]Level\|Set[ _]Prompt\|Set[ _]Newline\|Set[ _]Encoding\|Set[ _]Default[ _]Log[ _]Level\|Read[ _]Until[ _]Regexp\|Read[ _]Until[ _]Prompt\|Read[ _]Until\|Read\|Open[ _]Connection\|Login\|Execute[ _]Command\|Close[ _]Connection\|Close[ _]All[ _]Connections\)\>"
syn match xmlLibrary                "\c\<\(Set Element[ _]Text\|Set[ _]Element[ _]Tag\|Set[ _]Elements[ _]Text\|Set[ _]Elements[ _]Tag\|Set[ _]Elements[ _]Attribute\|Set[ _]Element[ _]Attribute\|Save[ _]Xml\|Remove[ _]Elements[ _]Attributes\|Remove[ _]Elements[ _]Attribute\|Remove[ _]Elements\|Remove[ _]Element[ _]Attributes\|Remove[ _]Element[ _]Attribute\|Remove[ _]Element\|Parse[ _]Xml\|Log[ _]Element\|Get[ _]Element[ _]Text\|Get[ _]Elements[ _]Texts\|Get[ _]Elements\|Get[ _]Element[ _]Count\|Get[ _]Element[ _]Attributes\|Get[ _]Element[ _]Attribute\|Get[ _]Element\|Get[ _]Child[ _]Elements\|Evaluate[ _]Xpath\|Element[ _]To[ _]String\|Element[ _]Text[ _]Should[ _]Match\|Element[ _]Text[ _]Should[ _]Be\|Elements[ _]Should[ _]Match\|Elements[ _]Should[ _]Be[ _]Equal\|Element[ _]Should[ _]Not[ _]Have[ _]Attribute\|Element[ _]Should[ _]Not[ _]Exist\|Element[ _]Should[ _]Exist\|Element[ _]Attribute[ _]Should[ _]Match\|Element[ _]Attribute[ _]Should[ _]Be\|Copy[ _]Element\|Clear[ _]Element\|Add[ _]Element\)\>"

" Other libraries
" See and follow listing order as above.
syn match seleniumLibrary           "\c\<\(Xpath[ _]Should[ _]Match[ _]X Times\|Wait[ _]Until[ _]Page[ _]Does[ _]Not[ _]Contain[ _]Element\|Wait[ _]Until[ _]Page[ _]Does[ _]Not[ _]Contain\|Wait[ _]Until[ _]Page[ _]Contains[ _]Element\|Wait[ _]Until[ _]Page[ _]Contains\|Wait[ _]Until[ _]Element[ _]Is[ _]Visible\|Wait[ _]Until[ _]Element[ _]Is[ _]Not[ _]Visible\|Wait[ _]Until[ _]Element[ _]Is[ _]Enabled\|Wait[ _]Until[ _]Element[ _]Does[ _]Not[ _]Contain\|Wait[ _]Until[ _]Element[ _]Contains\|Wait[ _]For[ _]Condition\|Unselect[ _]From[ _]List[ _]By[ _]Value\|Unselect[ _]From[ _]List[ _]By[ _]Label\|Unselect[ _]From[ _]List[ _]By[ _]Index\|Unselect[ _]From[ _]List\|Unselect[ _]Frame\|Unselect[ _]Checkbox\|Title[ _]Should[ _]Be\|Textfield[ _]Value[ _]Should[ _]Be\|Textfield[ _]Should[ _]Contain\|Textarea[ _]Value[ _]Should[ _]Be\|Textarea[ _]Should[ _]Contain\|Table[ _]Should[ _]Contain\|Table[ _]Row[ _]Should[ _]Contain\|Table[ _]Header[ _]Should[ _]Contain\|Table[ _]Footer[ _]Should[ _]Contain\|Table[ _]Column[ _]Should[ _]Contain\|Table[ _]Cell[ _]Should[ _]Contain\|Switch[ _]Browser\|Submit[ _]Form\|Simulate\|Set[ _]Window[ _]Size\|Set[ _]Window[ _]Position\|Set[ _]Selenium[ _]Timeout\|Set[ _]Selenium[ _]Speed\|Set[ _]Selenium[ _]Implicit[ _]Wait\|Set[ _]Screenshot[ _]Directory\|Set[ _]Browser[ _]Implicit[ _]Wait\|Select[ _]Window\|Select[ _]Radio[ _]Button\|Select[ _]From[ _]List[ _]By[ _]Value\|Select[ _]From[ _]List[ _]By[ _]Label\|Select[ _]From[ _]List[ _]By[ _]Index\|Select[ _]From[ _]List\|Select[ _]Frame\|Select[ _]Checkbox\|Select[ _]All[ _]From[ _]List\|Remove[ _]Location[ _]Strategy\|Reload[ _]Page\|Register[ _]Keyword[ _]To[ _]Run[ _]On[ _]Failure\|Radio[ _]Button[ _]Should[ _]Not[ _]Be[ _]Selected\|Radio[ _]Button[ _]Should[ _]Be[ _]Set[ _]To\|Press[ _]Key\|Page[ _]Should[ _]Not[ _]Contain[ _]Textfield\|Page[ _]Should[ _]Not[ _]Contain[ _]Radio[ _]Button\|Page[ _]Should[ _]Not[ _]Contain[ _]List\|Page[ _]Should[ _]Not[ _]Contain[ _]Link\|Page[ _]Should[ _]Not[ _]Contain[ _]Image\|Page[ _]Should[ _]Not[ _]Contain[ _]Element\|Page[ _]Should[ _]Not[ _]Contain[ _]Checkbox\|Page[ _]Should[ _]Not[ _]Contain[ _]Button\|Page[ _]Should[ _]Not[ _]Contain\|Page[ _]Should[ _]Contain[ _]Textfield\|Page[ _]Should[ _]Contain[ _]Radio[ _]Button\|Page[ _]Should[ _]Contain[ _]List\|Page[ _]Should[ _]Contain[ _]Link\|Page[ _]Should[ _]Contain[ _]Image\|Page[ _]Should[ _]Contain[ _]Element\|Page[ _]Should[ _]Contain[ _]Checkbox\|Page[ _]Should[ _]Contain[ _]Button\|Page[ _]Should[ _]Contain\|Open[ _]Context[ _]Menu\|Open[ _]Browser\|Mouse[ _]Up\|Mouse[ _]Over\|Mouse[ _]Out\|Mouse[ _]Down[ _]On[ _]Link\|Mouse[ _]Down[ _]On[ _]Image\|Mouse[ _]Down\|Maximize[ _]Browser[ _]Window\|Log[ _]Title\|Log[ _]Source\|Log[ _]Location\|Locator[ _]Should[ _]Match[ _]X Times\|Location[ _]Should[ _]Contain\|Location[ _]Should[ _]Be\|List[ _]Windows\|List[ _]Should[ _]Have[ _]No[ _]Selections\|List[ _]Selection[ _]Should[ _]Be\|Input[ _]Text[ _]Into[ _]Prompt\|Input[ _]Text\|Input[ _]Password\|Go[ _]To\|Go[ _]Back\|Get[ _]Window[ _]Titles\|Get[ _]Window[ _]Size\|Get[ _]Window[ _]Position\|Get[ _]Window[ _]Names\|Get[ _]Window[ _]Identifiers\|Get[ _]Webelements\|Get[ _]Vertical[ _]Position\|Get[ _]Value\|Get[ _]Title\|Get[ _]Text\|Get[ _]Table[ _]Cell\|Get[ _]Source\|Get[ _]Selenium[ _]Timeout\|Get[ _]Selenium[ _]Speed\|Get[ _]Selenium[ _]Implicit[ _]Wait\|Get[ _]Selected[ _]List[ _]Values\|Get[ _]Selected[ _]List[ _]Value\|Get[ _]Selected[ _]List[ _]Labels\|Get[ _]Selected[ _]List[ _]Label\|Get[ _]Matching[ _]Xpath[ _]Count\|Get[ _]Location\|Get[ _]List[ _]Items\|Get[ _]Horizontal[ _]Position\|Get[ _]Element[ _]Attribute\|Get[ _]Cookie[ _]Value\|Get[ _]Cookies\|Get[ _]All[ _]Links\|Get[ _]Alert[ _]Message\|Frame[ _]Should[ _]Contain\|Focus\|Execute[ _]Javascript\|Execute[ _]Async[ _]Javascript\|Element[ _]Text[ _]Should[ _]Be\|Element[ _]Should[ _]Not[ _]Contain\|Element[ _]Should[ _]Not[ _]Be[ _]Visible\|Element[ _]Should[ _]Contain\|Element[ _]Should[ _]Be[ _]Visible\|Element[ _]Should[ _]Be[ _]Enabled\|Element[ _]Should[ _]Be[ _]Disabled\|Drag[ _]And[ _]Drop[ _]By[ _]Offset\|Drag[ _]And[ _]Drop\|Double[ _]Click[ _]Element\|Dismiss[ _]Alert\|Delete[ _]Cookie\|Delete[ _]All[ _]Cookies\|Current[ _]Frame[ _]Should[ _]Not[ _]Contain\|Current[ _]Frame[ _]Contains\|Create[ _]Webdriver\|Confirm[ _]Action\|Close[ _]Window\|Close[ _]Browser\|Close[ _]All[ _]Browsers\|Click[ _]Link\|Click[ _]Image\|Click[ _]Element[ _]At[ _]Coordinates\|Click[ _]Element\|Click[ _]Button\|Clear[ _]Element[ _]Text\|Choose[ _]Ok[ _]On[ _]Next[ _]Confirmation\|Choose[ _]File\|Choose[ _]Cancel[ _]On[ _]Next[ _]Confirmation\|Checkbox[ _]Should[ _]Not[ _]Be[ _]Selected\|Checkbox[ _]Should[ _]Be[ _]Selected\|Capture[ _]Page[ _]Screenshot\|Assign[ _]Id[ _]To[ _]Element\|Alert[ _]Should[ _]Be[ _]Present\|Add[ _]Location[ _]Strategy\|Add[ _]Cookie\)\>"
syn match sshLibrary                "\c\<\(Write[ _]Until[ _]Expected[ _]Output\|Write[ _]Bare\|Write\|Switch[ _]Connection\|Start[ _]Command\|Set[ _]Default[ _]Configuration\|Set[ _]Client[ _]Configuration\|Read[ _]Until[ _]Regexp\|Read[ _]Until[ _]Prompt\|Read[ _]Until\|Read[ _]Command[ _]Output\|Read\|Put[ _]File\|Put[ _]Directory\|Open[ _]Connection\|Login[ _]With[ _]Public[ _]Key\|Login\|List[ _]Files[ _]In[ _]Directory\|List[ _]Directory\|List[ _]Directories[ _]In[ _]Directory\|Get[ _]File\|Get[ _]Directory\|Get[ _]Connections\|Get[ _]Connection\|File[ _]Should[ _]Not[ _]Exist\|File[ _]Should[ _]Exist\|Execute[ _]Command\|Enable[ _]Ssh[ _]Logging\|Directory[ _]Should[ _]Not[ _]Exist\|Directory[ _]Should[ _]Exist\|Close[ _]Connection\|Close[ _]All[ _]Connections\)\>"

" The built-in standard library comes last to re-match the keywords already caught.
" See and follow listing order as above.
syn match builtInLibrary            "\c\<\(Wait[ _]Until[ _]Keyword[ _]Succeeds\|Variable[ _]Should[ _]Not[ _]Exist\|Variable[ _]Should[ _]Exist\|Sleep\|Should[ _]Start[ _]With\|Should[ _]Not[ _]Start[ _]With\|Should[ _]Not[ _]Match[ _]Regexp\|Should[ _]Not[ _]Match\|Should[ _]Not[ _]End[ _]With\|Should[ _]Not[ _]Contain\|Should[ _]Not[ _]Be[ _]True\|Should[ _]Not[ _]Be[ _]Equal[ _]As[ _]Strings\|Should[ _]Not[ _]Be[ _]Equal[ _]As[ _]Numbers\|Should[ _]Not[ _]Be[ _]Equal[ _]As[ _]Integers\|Should[ _]Not[ _]Be[ _]Equal\|Should[ _]Not[ _]Be[ _]Empty\|Should[ _]Match[ _]Regexp\|Should[ _]Match\|Should[ _]End[ _]With\|Should[ _]Contain[ _]X Times\|Should[ _]Contain\|Should[ _]Be[ _]True\|Should[ _]Be[ _]Equal[ _]As[ _]Strings\|Should[ _]Be[ _]Equal[ _]As[ _]Numbers\|Should[ _]Be[ _]Equal[ _]As[ _]Integers\|Should[ _]Be[ _]Equal\|Should[ _]Be[ _]Empty\|Set[ _]Variable[ _]If\|Set[ _]Variable\|Set[ _]Test[ _]Variable\|Set[ _]Test[ _]Message\|Set[ _]Test[ _]Documentation\|Set[ _]Tags\|Set[ _]Suite[ _]Variable\|Set[ _]Suite[ _]Metadata\|Set[ _]Suite[ _]Documentation\|Set[ _]Log[ _]Level\|Set[ _]Library[ _]Search[ _]Order\|Set[ _]Global[ _]Variable\|Run[ _]Keyword[ _]Unless\|Run[ _]Keywords\|Run[ _]Keyword[ _]If[ _]Timeout[ _]Occurred\|Run[ _]Keyword[ _]If[ _]Test[ _]Passed\|Run[ _]Keyword[ _]If[ _]Test[ _]Failed\|Run[ _]Keyword[ _]If[ _]Any[ _]Tests[ _]Failed\|Run[ _]Keyword[ _]If[ _]Any[ _]Critical[ _]Tests[ _]Failed\|Run[ _]Keyword[ _]If[ _]All[ _]Tests[ _]Passed\|Run[ _]Keyword[ _]If[ _]All[ _]Critical[ _]Tests[ _]Passed\|Run[ _]Keyword[ _]If\|Run[ _]Keyword[ _]And[ _]Return[ _]Status\|Run[ _]Keyword[ _]And[ _]Return[ _]If\|Run[ _]Keyword[ _]And[ _]Return\|Run[ _]Keyword[ _]And[ _]Ignore[ _]Error\|Run[ _]Keyword[ _]And[ _]Expect[ _]Error\|Run[ _]Keyword[ _]And[ _]Continue[ _]On[ _]Failure\|Run[ _]Keyword\|Return[ _]From[ _]Keyword[ _]If\|Return[ _]From[ _]Keyword\|Replace[ _]Variables\|Repeat[ _]Keyword\|Remove[ _]Tags\|Regexp[ _]Escape\|Pass[ _]Execution[ _]If\|Pass[ _]Execution\|No[ _]Operation\|Log[ _]Variables\|Log[ _]To[ _]Console\|Log[ _]Many\|Log\|Length[ _]Should[ _]Be\|Keyword[ _]Should[ _]Exist\|Import[ _]Variables\|Import[ _]Resource\|Import[ _]Library\|Get[ _]Variable[ _]Value\|Get[ _]Variables\|Get[ _]Time\|Get[ _]Library[ _]Instance\|Get[ _]Length\|Get[ _]Count\|Fatal[ _]Error\|Fail\|Exit[ _]For[ _]Loop[ _]If\|Exit[ _]For[ _]Loop\|Evaluate\|Create[ _]List\|Convert[ _]To[ _]String\|Convert[ _]To[ _]Octal\|Convert[ _]To[ _]Number\|Convert[ _]To[ _]Integer\|Convert[ _]To[ _]Hex\|Convert[ _]To[ _]Bytes\|Convert[ _]To[ _]Boolean\|Convert[ _]To[ _]Binary\|Continue[ _]For[ _]Loop[ _]If\|Continue[ _]For[ _]Loop\|Comment\|Catenate\|Call[ _]Method\)\>"

" custom
syntax match robotSeparator /  /
highlight robotSeparator guibg=#303030 guifg=darkgreen gui=underline ctermbg=237
syntax match robotSeparatorEx /   \+/
highlight robotSeparatorEx guibg=#303030 guifg=red gui=underline ctermbg=52
syntax match robotIndent /^ */
highlight clear robotIndent

"------------------------------------------------------------------------
" Regions
"------------------------------------------------------------------------
" Single-line comments. Are there multi-line comments?
syn region robotComment     display start="^#" excludenl end="$"
syn region robotString      start="\"" excludenl end="\""

"------------------------------------------------------------------------
" Keywords
"------------------------------------------------------------------------

"------------------------------------------------------------------------
" Links
"------------------------------------------------------------------------
" hi def link robotVariable           Type
hi def link robotSetup              Include
hi def link robotSettings           Include
hi def link robotTestCaseName       Function
hi def link robotComment            Comment
hi def link robotEllipsis           String
hi def link robotTable              Identifier
hi def link robotImport             Include
hi def link robotSpecial            Special
hi def link robotString             String
hi def link robotNumber             Number
hi def link robotPath               Constant
hi def link robotOperator           Operator
hi def link robotCommonSet          Keyword
hi def link robotKeywordSet         Keyword
hi def link robotTestcaseSet        Keyword
hi def link robotGherkin            Keyword

hi def link builtInLibrary          Keyword
hi def link collectionsLibrary      Keyword
hi def link dateTimeLibrary         Keyword
hi def link dialogLibrary           Keyword
hi def link operatingSystemLibrary  Keyword
hi def link processLibrary          Keyword
hi def link screenshotLibrary       Keyword
hi def link stringLibrary           Keyword
hi def link telnetLibrary           Keyword
hi def link xmlLibrary              Keyword
hi def link seleniumLibrary         Keyword
hi def link sshLibrary              Keyword

let b:current_syntax = "robot"
"------------------------------------------------------------------------
let &cpo=s:cpo_save
" vim700: set fdm=marker:
