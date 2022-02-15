module New_Project 
    use clrwin
    implicit none 
    
    character(30) title 
    character(300) :: description = "Type the desc here"
    character(30) :: rscs_list(10), preReq_list(10)
    character(30) :: preReq = "Prerequisite knowledge required", rscs = "Add resource required"
    character(30) :: progress = "Record the progress"
    character(30) :: Remark = "Remarks (if any)"
    integer i


    CONTAINS 

    integer function fnNew()
        integer win2 

        !Colours 
        integer SysColor, FieldTextColor, Blue, greyish, white
        SysColor = rgb@(0, 0, 0)
        greyish = rgb@(225, 225, 225)
        FieldTextColor = rgb@(50, 50, 200)
        Blue = rgb@(0, 0, 50)
        white = rgb@(255, 255, 255)


        !Initialising project details 
        title = "thisgile"
        do i = 1, 10, 1
            rscs_list(i) = ""
            preReq_list(i) = ""
        end do

        !Opening a file to save all the data in

        !The caption and the window menu bar
        win2 = winio@('%ww[maximise]%sz&', 1600, 1000)
        win2 = winio@('%ca[New Project]&')
        win2 = winio@('%mn[Exit]&', 'exit')

        !Top Menu Bar and icon and Heading
        win2 = winio@('%cn%ob[]%fn[Consolas]%ts&', 1.2D0)
        win2 = winio@('%bg[grey]%nl  %ob[bottom_exit, invisible]'//&
                    & '%ob[invisible]%8bt[New]%cb '//&
                    & '%ob[invisible]%8bt[Open]%cb '//&
                    & '%ob[invisible]%8bt[Help]%cb '//&
                    & '%ob[invisible]%8bt[About]%cb '//&
                    & '%cb%nl&')
        win2 = winio@('%2.1ob[bottom_exit]%nl%9ta%fn[Calibri]%ts%bf%tc'//&
                    & 'New Project%`bf%cb%ta%ic[filecreate]%ta%cb&', 5.0D0, Blue)

        !The main body
        win2 = winio@('%tc%fn[Consolas]%ts%2.1ob[]&', SysColor, 1.3D0)
        !Field Name
        win2 = winio@('  %ob[][Name]%nl%2ta%`bg%tc%co[right_justify]%30rs%tc&'&
                    &, white, FieldTextColor, title, SysColor)
        !Description field 
        win2 = winio@('%2nl[Desc]%nl%2ta%`bg[white]%tc%co[]%30.4re[right_text]%tc&'&
                    &, FieldTextColor, description, SysColor)
        !Resources field 
        win2 = winio@('%6nl[Resources Required]%2nl%2ta%`bg[white]%tc%co[right_justify]%30rs%tc%nl%ts%rj%8bt[Add]%ts&'&
                    &, FieldTextColor, rscs, SysColor, 1.0D0, 1.3D0)
        !Prerequisite field 
        win2 = winio@('%2nl[Prerequisite]%nl%2ta%`bg[white]%tc%co[]%30rs[right_text]%tc%nl%ts%rj%8bt[Add]%ts&'&
                    &, FieldTextColor, preReq, SysColor, 1.0D0, 1.3D0)
        !Date field 
        !win2 = winio@('%nl[Deadline]%nl%2ta%`bg[white]%tc%co[right_justify]%30rs%tc&'&
        !            &, FieldTextColor, "28:04:1966", SysColor)
        !Cost field 
        win2 = winio@('%2nl[Est Cost]%nl%2ta%`bg[white]%tc%co[right_justify]%30rs%tc&'&
                    &, FieldTextColor, "Rs. 100", SysColor)
        win2 = winio@('%2nl %cb%tc%cb&', SysColor)

        !2nd Block
        win2 = winio@('%ta%ob[]%4tajhjh&')
        !Progress field
        !win2 = winio@('%nl[Progress]%2ta%`bg[white]%tc%co[]%30.2re[right_text]%tc&'&
        !            &, FieldTextColor, progress, SysColor)
        !Remark field
        !win2 = winio@('%3nl[Remark]%2ta%`bg[white]%tc%co[]%30.2re[right_text]&'&
        !            &, FieldTextColor, Remark)
        win2 = winio@('%cb%cb&')

        !The save button
        win2 = winio@('%ob[] %15bt[Save Data]%cb&')

        !The final closing box 
        win2 = winio@('%cb')


        !i = saveData(title, description, rscs_list, preReq_list)

        fnNew = 1
    end function fnNew 


end module New_Project 
