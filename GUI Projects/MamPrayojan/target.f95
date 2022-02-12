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
        integer SysColor, FieldTextColor, Blue
        SysColor = rgb@(0, 0, 0)
        FieldTextColor = rgb@(50, 50, 200)
        Blue = rgb@(0, 0, 100)
        
        title = "New Project"

        !The caption and the window menu bar
        win2 = winio@('%ww[maximise]%sz&', 1600, 1000)
        win2 = winio@('%ca[New Project]&')
        win2 = winio@('%mn[Exit]&', 'exit')

        !Top Menu Bar and icon and Heading
        win2 = winio@('%cn%ob[]%fn[Consolas]%ts&', 1.2D0)
        win2 = winio@('%bg[grey]%nl  %ob[bottom_exit, invisible]'//&
                    & '%ob[invisible]%^8bt[New]%cb '//&
                    & '%ob[invisible]%8bt[Open]%cb '//&
                    & '%ob[invisible]%8bt[Help]%cb '//&
                    & '%ob[invisible]%8bt[About]%cb '//&
                    & '%cb%nl&', fnNewAgain)
        win2 = winio@('%2.1ob[bottom_exit, invisible]%nl%10ta%fn[Verdana]%ts%bf%tc'//&
                    & 'New Project%`bf%cb%ta%ic[folder]%cb&', 4.0D0, Blue)

        !The main body
        win2 = winio@('%tc%fn[Consolas]%ts%nl%2.1ob[invisible]&', SysColor, 1.3D0)
        !Field Name
        win2 = winio@('  %ob[invisible][Name]%nl%2ta%`bg[white]%tc%co[right_justify]%30rs%tc&'&
                    &, FieldTextColor, title, SysColor)
        !Description field 
        win2 = winio@('%2nl[Desc]%nl%2ta%`bg[white]%tc%co[]%30.3re[right_text]%tc&'&
                    &, FieldTextColor, description, SysColor)
        !Resources field 
        win2 = winio@('%4nl[Resources Required]%2nl%2ta%`bg[white]%tc%co[right_justify]%30rs%tc%nl%ts%rj%8bt[Add]%ts&'&
                    &, FieldTextColor, rscs, SysColor, 1.0D0, 1.3D0)
        !Date field 
        win2 = winio@('%2nl[Deadline]%nl%2ta%`bg[white]%tc%co[right_justify]%30rs%tc&'&
                    &, FieldTextColor, "28:04:1966", SysColor)
        !Prerequisite field 
        win2 = winio@('%2nl[Prerequisite]%nl%2ta%`bg[white]%tc%co[]%30rs[right_text]%tc%nl%ts%rj%8bt[Add]%ts&'&
                    &, FieldTextColor, preReq, SysColor, 1.0D0, 1.3D0)
        !Cost field 
        win2 = winio@('%2nl[Cost]%nl%2ta%`bg[white]%tc%co[right_justify]%30rs%tc&'&
                    &, FieldTextColor, "Rs. 100", SysColor)
        win2 = winio@('%nl %cb%tc%cb&', SysColor)

        !2nd Block
        !Progress field
        win2 = winio@('%ta%ob[invisible]&')
        win2 = winio@('%nl[Progress]%2ta%`bg[white]%tc%co[]%30.2re[right_text]%tc&'&
                    &, FieldTextColor, progress, SysColor)
        !Remark field
        win2 = winio@('%3nl[Remark]%2ta%`bg[white]%tc%co[]%30.2re[right_text]&'&
                    &, FieldTextColor, Remark)
        win2 = winio@('%cb%cb%ta%cb')
        fnNew = 1
    end function fnNew 

    integer function fnNewAgain()
        integer j
        j = fnNew()
        fnNewAgain = j 
    end function fnNewAgain

end module projectRecord 


RESOURCES 
    folder ICON "folder.ico"
