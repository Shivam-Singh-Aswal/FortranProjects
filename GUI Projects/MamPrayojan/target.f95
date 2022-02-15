winapp 

module projectRecord
    use clrwin 
    implicit none

    !These are the main window variables
    integer win1, winio@, fnNew
    character(200) savePath 

    !The new project window variables (np refers to new project)
    integer np_win      !New project window
    logical new_project
    character(30) np_title, np_name
    character(300) :: np_description = "Type the desc here"
    character(30) :: np_rscs_list(10), np_preReq_list(10)
    character(30) :: np_preReq = "Prerequisite knowledge required", np_rscs = "Add resource required"
    character(30) :: np_progress = "Record the progress"
    character(30) :: np_Remark = "Remarks (if any)"
    character(5) :: np_cost 
    
    !The open file window variables ('open' refers to open file)
    character(200) :: openFile_name = "" 

    CONTAINS 

    integer function appGui()
        character(30) :: nameOfApp = "Mam Prayojan"

        !Colours
        integer titleColor, black
        titleColor = rgb@(0, 0, 50)
        black = rgb@(0, 0, 0)

        !The caption and the window menu bar
        win1 = winio@('%ww[maximise]%sz&', 1600, 1000)
        win1 = winio@('%ca[MamPrayojan]&')
        win1 = winio@('%mn[New, Exit]&', fnNew, 'exit')

        !Settings for default window
        win1 = winio@('%bg[grey]&')

        !This is the main box
        win1 = winio@('%`bg[white]%cn%ob[]&')
        win1 = winio@('%nl%ta%fn[Calibri]%ts%tc%bf'//nameOfApp//'%`bf&', 5.0D0, titleColor)

        !Creating the controls for newfile, open file, search etc.
        win1 = winio@('%fn[Calibri]%ts%tc%3nl%ob[]&', 1.6D0, black)
        win1 = winio@('%ta%1.2ob[]%^ic[filecreate]%cbNew Project%cb&', fnNew)
        win1 = winio@('%ta%1.2ob[]%^ic[fileopen]%cbOpen project%cb&', openFile)
        win1 = winio@('%ta%1.2ob[]%ic[filesearch]%cbSearch project%cb&')
        win1 = winio@('%6nl %cb%cb')
        
        appGui = 1
    end function appGui 


    integer function fnNew()
        integer temp_win

        new_project = .true.

        np_name = ""
        temp_win = winio@("%ca[Project's name]%bg[grey]&")
        temp_win = winio@('%fn[consolas]%ts%nl%`bg[white]%ob[named_l][Project name]&', 2.0D0)
        temp_win = winio@('%nl%ta%ts%`bg[white]%20rs&', 1.0D0, np_name)
        temp_win = winio@('%2nl%cn%`bt[Create]%ta%^bt[Cancel]&', cancelNewProject)
        temp_win = winio@('%nl %cb')

        if (new_project) temp_win = newProjectDataWindow()
        fnNew = temp_win
    end function fnNew
    

    integer function cancelNewProject()
        new_project = .false.
        cancelNewProject = 0
    end function cancelNewProject 


    integer function newProjectDataWindow()
        integer i

        !Colours
        integer SysColor, FieldTextColor, Blue, greyish, white
        SysColor = rgb@(0, 0, 0)
        greyish = rgb@(225, 225, 225)
        FieldTextColor = rgb@(50, 50, 200)
        Blue = rgb@(0, 0, 50)
        white = rgb@(255, 255, 255)
        
        !Initialising project details 
        np_title = "thisfile"
        do i = 1, 10, 1
            np_rscs_list(i) = ""
            np_preReq_list(i) = ""
        end do
        np_cost = "100"

        !Opening a file to save all the data in

        !The caption and the window menu bar
        np_win = winio@('%ww[maximise]%sz&', 1600, 1000)
        np_win = winio@('%ca['//np_name//']&')
        np_win = winio@('%mn[Exit]&', 'exit')

        !Top Menu Bar and icon and Heading
        np_win = winio@('%cn%ob[]%fn[Consolas]%ts&', 1.2D0)
        np_win = winio@('%bg[grey]%nl  %ob[bottom_exit, invisible]'//&
                    & '%ob[invisible]%^8bt[New]%cb '//&
                    & '%ob[invisible]%8bt[Open]%cb '//&
                    & '%ob[invisible]%8bt[Help]%cb '//&
                    & '%ob[invisible]%8bt[About]%cb '//&
                    & '%cb%nl&', fnNew)
        np_win = winio@('%2.1ob[bottom_exit]%nl%9ta%fn[Calibri]%ts%bf%tc'//&
                    & 'New Project%`bf%cb%ta%ic[filecreate]%ta%cb&', 5.0D0, Blue)

        !The main body
        np_win = winio@('%tc%fn[Consolas]%ts%2.1ob[]&', SysColor, 1.3D0)
        !Field Name
        np_win = winio@('  %ob[][Name]%nl%2ta%`bg%tc%co[right_justify]%30rs%tc&'&
                    &, white, FieldTextColor, np_title, SysColor)
        !Description field 
        np_win = winio@('%2nl[Desc]%nl%2ta%`bg[white]%tc%co[]%30.4re[right_text]%tc&'&
                    &, FieldTextColor, np_description, SysColor)
        !Resources field 
        np_win = winio@('%6nl[Resources Required]%2nl%2ta%`bg[white]%tc%co[right_justify]%30rs%tc%nl%ts%rj%8bt[Add]%ts&'&
                    &, FieldTextColor, np_rscs, SysColor, 1.0D0, 1.3D0)
        !Prerequisite field 
        np_win = winio@('%2nl[Prerequisite]%nl%2ta%`bg[white]%tc%co[]%30rs[right_text]%tc%nl%ts%rj%8bt[Add]%ts&'&
                    &, FieldTextColor, np_preReq, SysColor, 1.0D0, 1.3D0)
        !Date field 
        !np_win = winio@('%nl[Deadline]%nl%2ta%`bg[white]%tc%co[right_justify]%30rs%tc&'&
        !            &, FieldTextColor, "28:04:1966", SysColor)
        !Cost field 
        np_win = winio@('%2nl[Est Cost (in Rs)]%nl%2ta%`bg[white]%tc%co[right_justify]%30rs%tc&'&
                    &, FieldTextColor, np_cost, SysColor)
        np_win = winio@('%2nl %cb%tc%cb&', SysColor)

        !2nd Block
        np_win = winio@('%ta%ob[]%4tajhjh&')
        !Progress field
        !np_win = winio@('%nl[Progress]%2ta%`bg[white]%tc%co[]%30.2re[right_text]%tc&'&
        !            &, FieldTextColor, progress, SysColor)
        !Remark field
        !np_win = winio@('%3nl[Remark]%2ta%`bg[white]%tc%co[]%30.2re[right_text]&'&
        !            &, FieldTextColor, Remark)
        np_win = winio@('%cb%cb&')

        !The save button
        np_win = winio@('%ob[] %^`15bt[Save Data]%cb&', saveData)

        !The final closing box 
        np_win = winio@('%cb')

        newProjectDataWindow = 1
    end function newProjectDataWindow 


    integer function saveData()
        OPEN (unit= 10, file= "ProjectsDB/"//trim(adjustl(np_title))//".mp", status= "new")
        WRITE(10,"(A30)") np_title 
        WRITE(10,"(A300)") np_description
        CLOSE(10)
        saveData = 0 
    end function saveData 


    integer function openFile()
        integer openFile_win 
        openFile_name = ""
        
        openFile_win = winio@('%ca[Choose file to open]&')
        openFile_win = winio@('%fs[D:\*.*]&')
        openFile_win = winio@('%^bt[Open]', 'FILE_OPENR', openFile_name, cb_openFile)

        openFile = 1  
    end function openFile


    integer function cb_openFile()
        cb_openFile = 0
    end function cb_openFile 


end module projectRecord 


RESOURCES 
    folder ICON "images/folder.ico"
    filecreate ICON "images/createfileicon.ico"
    fileopen ICON "images/openfileicon.ico"
    filesearch ICON "images/searchfileicon.ico"
