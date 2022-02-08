winapp 

module projectRecord
    use clrwin 
    implicit none

    integer win1, win2, winio@, fnNew
    

    CONTAINS 

    integer function appGui()
        win1 = winio@('%sz&', 1400, 800)
        win1 = winio@('%mn[New, Exit]&', fnNew, 'exit')
        win1 = winio@('%5nl%2taThis is a new initiative.%2ta%5nl')
        
        appGui = 1
    end function appGui 

    
    integer function fnNew()
        character(30) title 
        character(300) :: description = "Type the desc here"
        character(30) :: rscs = "Resources required"
        character(30) :: preReq = "Prerequisite knowledge required"
        character(30) :: progress = "Record the progress"
        character(30) :: Remark = "Remarks (if any)"

        !Colours
        integer SysColor, FieldTextColor
        SysColor = rgb@(0, 0, 0)
        FieldTextColor = rgb@(50, 50, 200)
        
        title = "New Project"

        !The caption and the window menu bar
        win2 = winio@('%sz&', 1100, 1100)
        win2 = winio@('%ca[New Project]&')
        win2 = winio@('%mn[Exit]&', 'exit')

        !Top Menu Bar and icon and Heading
        win2 = winio@('%fn[Consolas]%ts&', 1.2D0)
        win2 = winio@('%bg[grey]%ob[bottom_exit, invisible]'//&
                    & '%ob[invisible]%^8bt[New]%cb '//&
                    & '%ob[invisible]%8bt[Open]%cb '//&
                    & '%ob[invisible]%8bt[Help]%cb '//&
                    & '%ob[invisible]%8bt[About]%cb '//&
                    & '%cb%nl&', fnNewAgain)
        win2 = winio@('%fn[Calibri]%ts&', 4.0D0)
        win2 = winio@('%2.1ob[bottom_exit, invisible]%ic[folder]%cb%nl%cn%2taNew Project%2ta%cb&')

        !The main body
        win2 = winio@('%fn[Consolas]%2.1ob[raised]%ts&', 1.3D0)
        !Field Name
        win2 = winio@('%ob%2nl[Name]%3ta%`bg[white]%tc%co[right_justify]%30rs%tc&'&
                    &, FieldTextColor, title, SysColor)
        !Description field 
        win2 = winio@('%2nl[Desc]%3ta%`bg[white]%tc%co[]%30.2re[right_text]%tc&'&
                    &, FieldTextColor, description, SysColor)
        !Resources field 
        win2 = winio@('%3nl[Resources Required]%ta%`bg[white]%tc%co[]%30.2re[right_text]%tc&'&
                    &, FieldTextColor, rscs, SysColor)
        !Date field 
        win2 = winio@('%4nl[Deadline]%3ta%`bg[white]%tc%co[right_justify]%30rs%tc&'&
                    &, FieldTextColor, "28:04:1966", SysColor)
        !Prerequisite field 
        win2 = winio@('%2nl[Prerequisite]%2ta%`bg[white]%tc%co[]%30.2re[right_text]%tc&'&
                    &, FieldTextColor, preReq, SysColor)
        !Cost field 
        win2 = winio@('%3nl[Cost]%3ta%`bg[white]%tc%co[right_justify]%30rs%tc&'&
                    &, FieldTextColor, "Rs. 100", SysColor)
        !Progress field
        !win2 = winio@('%2nl[Progress]%3ta%`bg[white]%tc%co[]%30.2re[right_text]%tc&'&
        !            &, FieldTextColor, progress, SysColor)
        !Remark field
        !win2 = winio@('%3nl[Remark]%3ta%`bg[white]%tc%co[]%30.2re[right_text]&'&
        !            &, FieldTextColor, Remark)
        win2 = winio@('%2nl %cb%tc&', SysColor)
        win2 = winio@('%cbhhh%cb')
        fnNew = 1
    end function fnNew 

    integer function fnNewAgain()
        integer j
        j = fnNew()
        fnNewAgain = j 
    end function fnNewAgain

end module projectRecord 


RESOURCES 
    folder ICON "folde.ico"
