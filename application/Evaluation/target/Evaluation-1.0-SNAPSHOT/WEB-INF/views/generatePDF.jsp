<%@page import="com.evaluation.beans.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.evaluation.utils.DBUtils"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%
    Users userInSession = (Users) request.getAttribute("userInSession");
    request.setAttribute("userInSession", userInSession);
    System.out.println("userInSession=" + userInSession.getName());
%>
<!DOCTYPE html>
<html xmlns:v="urn:schemas-microsoft-com:vml"
      xmlns:o="urn:schemas-microsoft-com:office:office"
      xmlns:w="urn:schemas-microsoft-com:office:word"
      xmlns:m="http://schemas.microsoft.com/office/2004/12/omml"
      xmlns="http://www.w3.org/TR/REC-html40">
    <script src="scripts/convertscript.js"></script>
    <script src="https://raw.githack.com/eKoopmans/html2pdf/master/dist/html2pdf.bundle.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <head>
        <title>
            Εφαρμογή Αξιολόγησης Στρατιωτικού Προσωπικού
        </title>
        <meta charset="UTF-8">
        <meta http-equiv=Content-Type content="text/html; charset=windows-1253">
        <meta name=ProgId content=Word.Document>
        <meta name=Generator content="Microsoft Word 15">
        <meta name=Originator content="Microsoft Word 15">
        <link rel=File-List href="PDF.files/filelist.xml">
        <link rel=themeData href="PDF.files/themedata.thmx">
        <link rel=colorSchemeMapping href="PDF.files/colorschememapping.xml">

        <!---------------------------------------------------------------------------------------------------------------------------------------->
        <style>
            /* Font Definitions */
            @font-face
            {font-family:"Cambria Math";
             panose-1:2 4 5 3 5 4 6 3 2 4;
             mso-font-charset:161;
             mso-generic-font-family:roman;
             mso-font-pitch:variable;
             resize: none;
             mso-font-signature:-536869121 1107305727 33554432 0 415 0;}
            @font-face
            {font-family:Tahoma;
             panose-1:2 11 6 4 3 5 4 4 2 4;
             mso-font-charset:161;
             mso-generic-font-family:swiss;
             mso-font-pitch:variable;
             resize: none;
             mso-font-signature:-520081665 -1073717157 41 0 66047 0;}
            /* Style Definitions */
            p.MsoNormal, li.MsoNormal, div.MsoNormal
            {mso-style-unhide:no;
             mso-style-qformat:yes;
             mso-style-parent:"";
             margin:0cm;
             mso-pagination:widow-orphan;
             font-size:12.0pt;
             font-family:"Times New Roman",serif;
             mso-fareast-font-family:"Times New Roman";
             resize: none;}
            h3
            {mso-style-unhide:no;
             mso-style-qformat:yes;
             mso-style-next:Βασικό;
             margin-top:12.0pt;
             margin-right:0cm;
             margin-bottom:3.0pt;
             margin-left:0cm;
             mso-pagination:widow-orphan;
             page-break-after:avoid;
             mso-outline-level:3;
             font-size:13.0pt;
             resize: none;
             font-family:"Arial",sans-serif;}
            h4 
            {mso-style-unhide:no;
             mso-style-qformat:yes;
             mso-style-next:Βασικό;
             margin-top:12.0pt;
             margin-right:0cm;
             margin-bottom:3.0pt;
             margin-left:0cm;
             mso-pagination:widow-orphan;
             page-break-after:avoid;
             mso-outline-level:4;
             font-size:14.0pt;
             resize: none;
             font-family:"Times New Roman",serif;}
            h5
            {mso-style-unhide:no;
             mso-style-qformat:yes;
             mso-style-next:Βασικό;
             margin-top:12.0pt;
             margin-right:0cm;
             margin-bottom:3.0pt;
             margin-left:0cm;
             mso-pagination:widow-orphan;
             mso-outline-level:5;
             font-size:13.0pt;
             resize: none;
             font-family:"Times New Roman",serif;
             font-style:italic;}
            p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
            {mso-style-noshow:yes;
             mso-style-unhide:no;
             margin:0cm;
             resize: none;
             mso-pagination:widow-orphan;
             font-size:8.0pt;
             font-family:"Tahoma",sans-serif;
             mso-fareast-font-family:"Times New Roman";}
            .MsoChpDefault
            {mso-style-type:export-only;
             mso-default-props:yes;}
            @page WordSection1
            {size:595.3pt 841.9pt;
             margin:2.0cm 2.0cm 2.0cm 99.25pt;
             mso-header-margin:35.45pt;
             resize: none;
             mso-footer-margin:35.45pt;
             mso-paper-source:0;}
            div.WordSection1
            {page:WordSection1;
             resize: none;}

        </style>

        <!---------------------------------------------------------------------------------------------------------------------------------------->

        <style>
            /* Style Definitions */
            table.MsoNormalTable
            {mso-style-name:"Κανονικός πίνακας";
             mso-tstyle-rowband-size:0;
             mso-tstyle-colband-size:0;
             mso-style-noshow:yes;
             mso-style-unhide:no;
             mso-style-parent:"";
             mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
             mso-para-margin:0cm;
             mso-pagination:widow-orphan;
             font-size:10.0pt;
             font-family:"Times New Roman",serif;}
            </style>
        </head>

        <!---------------------------------------------------------------------------------------------------------------------------------------->        
        <!-- ΟΤΙ ΑΦΟΡΑ ΤΑ ΣΤΟΙΧΕΙΑ ΤΟΥ ΧΡΗΣΤΗ ΕΙΝΑΙ ΕΔΩ-->


        <body id="target" lang=EL style='tab-interval:36.0pt;position: static;' >


        <form action="" method="get">       

            <c:forEach items="${generatePDFelements}" var="elementsPDF"> 


                <div class=WordSection1>

                    <p class=MsoNormal align=center style='text-align:center;tab-stops:36.0pt 54.15pt 72.3pt 90.45pt 108.6pt 126.7pt'><b style='mso-bidi-font-weight:
                                                                                                                                         normal'><u><span style='font-family:"Arial",sans-serif'><br>
                                    ΕΤΗΣΙΟ ΕΝΤΥΠΟ ΑΠΟΤΕΛΕΣΜΑΤΩΝ ΑΞΙΟΛΟΓΗΣΕΩΝ<o:p></o:p></span></u></b></p>

                    <p class=MsoNormal><o:p>&nbsp;</o:p></p>


                    <p class=MsoNormal align=center style='text-align:center'><b style='mso-bidi-font-weight:
                                                                                 normal'><u><span lang=EN-US style='font-family:"Arial",sans-serif;mso-ansi-language:
                                   EN-US'>TOY</span></u></b><b style='mso-bidi-font-weight:normal'><u><span
                                    style='font-family:"Arial",sans-serif'><span style='mso-tab-count:2'> (Βαθμός) </span>${elementsPDF.getRank()}<span
                                        style='mso-tab-count:3'> (Ονοματεπώνυμο) ${elementsPDF.getName()} ${elementsPDF.getSurname()} </span><o:p></o:p></span></u></b></p>


                    <p class=MsoNormal><o:p>&nbsp;</o:p></p>



                    <p class=MsoNormal align=center style='text-align:center'><b style='mso-bidi-font-weight:
                                                                                 normal'><u><span style='font-family:"Arial",sans-serif;mso-ansi-language:
                                   EN-US'>TOY</span></u></b><b style='mso-bidi-font-weight:normal'><u>                <span
                                    style='font-family:"Arial",sans-serif'><span style='mso-tab-count:4'>(Πατρώνυμο) </span>${elementsPDF.getFathersname()}<span
                                        style='mso-tab-count:2'> (ΑΜ) </span>${elementsPDF.getAm()}<o:p></o:p></span></u></b></p>

                    <p class=MsoNormal><o:p>&nbsp;</o:p></p>





                    <p class=MsoNormal align=center style='margin-right:-34.7pt;text-align:center;
                       tab-stops:36.0pt 54.15pt 72.3pt 90.45pt 108.6pt 126.7pt'><span
                            style='font-family:"Arial",sans-serif'><o:p>&nbsp;</o:p></span></p>

                    <!---------------------------------------------------------------------------------------------------------------------------------------->
                    <!-- ΑΠΟ ΕΔΩ ΚΑΙ ΚΑΤΩ ΞΕΚΙΝΑΕΙ Ο ΠΙΝΑΚΑΣ ΝΑ ΔΙΑΜΟΡΦΩΝΕΤΑΙ-->

                    <div align=center>

                        <table class=MsoNormalTable border=1 cellspacing=0 cellpadding=0 width=670
                               style='width:470pt;border-collapse:collapse;border:none;mso-border-alt:solid windowtext .5pt;
                               mso-padding-alt:0cm 5.4pt 0cm 5.4pt;mso-border-insideh:.5pt solid windowtext;
                               mso-border-insidev:.5pt solid windowtext'>
                            <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;height: 50px;'>

                                <td width=670 colspan=6 style='width:470pt;border:solid windowtext 1.0pt;
                                    mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>




                                    <h3 style='text-align:center;tab-stops:36.0pt 54.15pt 72.3pt 90.45pt 108.6pt 126.7pt'><span
                                            style='mso-spacerun:yes'></span>ΑΞΙΟΛΟΓΗΣΗ ΣΤΗ ΘΕΩΡΙΑ<o:p></o:p></span></h3>
                                </td>
                            </tr>


                            <tr style='mso-yfti-irow:1;height:50pt'>
                                <td width=163 colspan=2 style='width:122.4pt;border:solid windowtext 1.0pt;
                                    border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
                                    padding:0cm 5.4pt 0cm 5.4pt'>



                                    <p class=MsoNormal style='text-align: center;tab-stops:
                                       36.0pt 54.15pt 72.3pt 90.45pt 108.6pt 126.7pt'><b style='mso-bidi-font-weight:
                                         normal'><span style='font-family:"Arial",sans-serif'><span
                                                    style='mso-spacerun:yes'>   </span>ΑΞΙΟΛΟΓΗΣΗ <o:p></o:p></span></b></p>
                                </td>



                                <td width=100 style='width:100pt;border-top:none;border-left:none;
                                    border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                                    mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
                                    mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
                                    <p class=MsoNormal style='text-align:center;tab-stops:
                                       36.0pt 54.15pt 72.3pt 90.45pt 108.6pt 126.7pt'><b style='mso-bidi-font-weight:
                                         normal'><span style='font-family:"Arial",sans-serif'><span
                                                    style='mso-spacerun:yes'> </span>ΒΑΘΜΟΛΟΓΙΑ<o:p></o:p></span></b></p>
                                </td>



                                <td width=139 style='width:115pt;border-top:none;border-left:none;
                                    border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                                    mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
                                    mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
                                    <p class=MsoNormal style='margin-right:10pt;text-align:center;tab-stops:
                                       36.0pt 54.15pt 72.3pt 90.45pt 108.6pt 126.7pt'><b style='mso-bidi-font-weight:
                                         normal'><span style='font-family:"Arial",sans-serif'><span
                                                    style='mso-spacerun:yes'>  </span>ΗΜΕΡΟΜΗΝΙΑ <o:p></o:p></span></b></p>
                                    <p class=MsoNormal style='text-align:center;tab-stops:
                                       36.0pt 54.15pt 72.3pt 90.45pt 108.6pt 126.7pt'><b><span style='font-family:
                                               "Arial",sans-serif'>ΑΞΙΟΛΟΓΗΣΕΩΣ</span></b><b style='mso-bidi-font-weight:
                                                                    normal'><span style='font-family:"Arial",sans-serif'><o:p></o:p></span></b></p>
                                </td>



                                <td width=90 style='width:90pt;border-top:none;border-left:none;border-bottom:
                                    solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;mso-border-top-alt:
                                    solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
                                    solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
                                    <p class=MsoNormal style='margin-right:10pt;text-align:center;tab-stops:
                                       36.0pt 54.15pt 72.3pt 90.45pt 108.6pt 126.7pt'><b><span style='font-family:
                                               "Arial",sans-serif'><span style='mso-spacerun:yes'>   </span>ΛΗΞΗ<o:p></o:p></span></b></p>
                                    <p class=MsoNormal style='text-align:center;tab-stops:
                                       36.0pt 54.15pt 72.3pt 90.45pt 108.6pt 126.7pt'><b><span style='font-family:
                                               "Arial",sans-serif'>ΙΣΧΥΟΣ(α)</span></b><b style='mso-bidi-font-weight:normal'><span
                                                style='font-family:"Arial",sans-serif'><o:p></o:p></span></b></p>
                                </td>



                                <td width=98 rowspan=2 valign=top style='width:100pt;border-top:none;
                                    border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                                    mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
                                    mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
                                    <p class=MsoNormal style='text-align:center;tab-stops:
                                       36.0pt 54.15pt 72.3pt 90.45pt 108.6pt 126.7pt'><b><span style='font-family:
                                               "Arial",sans-serif;text-align:center;'>ΠΑΡ/ΣΕΙΣ <br><br>∅<o:p></o:p></span></b></p>
                                </td>
                            </tr>



                            <tr style='mso-yfti-irow:2;height:50pt'>

                                <td width=163 colspan=2 style='width:122.4pt;border:solid windowtext 1.0pt;
                                    border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
                                    padding:0cm 5.4pt 0cm 5.4pt;height:26.95pt'>
                                    <p class=MsoNormal style='text-align: center;margin-right:-5pt;tab-stops:
                                       36.0pt 54.15pt 72.3pt 90.45pt 108.6pt 126.7pt'><b style='mso-bidi-font-weight:
                                         normal' ><span style='font-family:"Arial",sans-serif'>ΤΑΚΤΙΚΗ<o:p>&nbsp;</o:p></span></b></p>
                                </td>


                                <td width=125 style='width:93.6pt;border-top:none;border-left:none;
                                    border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                                    mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
                                    mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:26.95pt'>
                                    <p class=MsoNormal style='text-align: center;margin-right:-5pt;tab-stops:36.0pt 54.15pt 72.3pt 90.45pt 108.6pt 126.7pt'><b
                                            style='mso-bidi-font-weight:normal'><span style='font-family:"Arial",sans-serif'>${elementsPDF.getExamGrade()}<o:p>&nbsp;</o:p></span></b></p>
                                </td>


                                <td width=139 style='width:104.4pt;border-top:none;border-left:none;
                                    border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                                    mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
                                    mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:26.95pt'>
                                    <p class=MsoNormal style='text-align: center;margin-right:-5pt;tab-stops:36.0pt 54.15pt 72.3pt 90.45pt 108.6pt 126.7pt'><b
                                            style='mso-bidi-font-weight:normal'><span style='font-family:"Arial",sans-serif;text-align:center'>${elementsPDF.getDate()}<o:p>&nbsp;</o:p></span></b></p>
                                </td>



                                <td width=96 style='width:72.0pt;border-top:none;border-left:none;border-bottom:
                                    solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;mso-border-top-alt:
                                    solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
                                    solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:26.95pt'>
                                    <p class=MsoNormal style='text-align: center;margin-right:-5pt;tab-stops:36.0pt 54.15pt 72.3pt 90.45pt 108.6pt 126.7pt'><b><span
                                                style='font-family:"Arial",sans-serif;text-align: center'>Ένα (1) Έτος<o:p>&nbsp;</o:p></span></b></p>
                                </td>
                            </tr>




                            <tr style='mso-yfti-irow:3;height:40pt'>
                                <td width=621 colspan=6 style='text-align:center;border:solid windowtext 1.0pt;
                                    border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
                                    '>



                                    <h3 style='text-align:center;tab-stops:36.0pt 54.15pt 72.3pt 90.45pt 108.6pt 126.7pt'><span
                                            style='mso-spacerun:yes'></span>ΑΞΙΟΛΟΓΗΣΗ ΣΤΗ ΠΡΑΞΗ<o:p></o:p></span></h3>
                                </td>
                            </tr>

                            <!---------------------------------------------------------------------------------------------------------------------------------------->         

                            <tr style='mso-yfti-irow:4;height:50pt'>
                                <td width=156 style='width:117.0pt;border:solid windowtext 1.0pt;border-top:
                                    none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
                                    padding:0cm 5.4pt 0cm 5.4pt'>
                                    <p class=MsoNormal style='text-align:center;tab-stops:
                                       36.0pt 54.15pt 72.3pt 90.45pt 108.6pt 126.7pt'><b style='mso-bidi-font-weight:
                                         normal'><span style='font-size:16px;font-family:"Arial",sans-serif'>ΑΞΙΟΛΟΓΗΣΗ<o:p></o:p></span></b></p>
                                </td>


                                <!---------------------------------------------------------------------------------------------------------------------------------------->         


                                <td width=132 colspan=2 style='width:99.0pt;border-top:none;border-left:none;
                                    border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                                    mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
                                    mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
                                    <p class=MsoNormal style='text-align:center;tab-stops:
                                       36.0pt 54.15pt 72.3pt 90.45pt 108.6pt 126.7pt'><b style='mso-bidi-font-weight:
                                         normal'><span style='font-size:16px;font-family:"Arial",sans-serif'><span
                                                    style='mso-spacerun:yes'> </span>ΒΑΘΜΟΛΟΓΙΑ<o:p></o:p></span></b></p>
                                </td>
                                <!---------------------------------------------------------------------------------------------------------------------------------------->         

                                <td width=139 style='width:104.4pt;border-top:none;border-left:none;
                                    border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                                    mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
                                    mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
                                    <p class=MsoNormal style='margin-right:5pt;text-align:center;tab-stops:
                                       36.0pt 54.15pt 72.3pt 90.45pt 108.6pt 126.7pt'><b style='mso-bidi-font-weight:
                                         normal'><span style='font-family:"Arial",sans-serif'><span
                                                    style='mso-spacerun:yes'>  </span>ΗΜΕΡΟΜΗΝΙΑ<o:p></o:p></span></b></p>
                                    <p class=MsoNormal style='text-align:center;tab-stops:
                                       36.0pt 54.15pt 72.3pt 90.45pt 108.6pt 126.7pt'><b style='mso-bidi-font-weight:
                                         normal'><span style='font-size:16px;font-family:"Arial",sans-serif'>ΑΞΙΟΛΟΓΗΣΕΩΣ<o:p></o:p></span></b></p>
                                </td>

                                <!---------------------------------------------------------------------------------------------------------------------------------------->         

                                <td width=96 style='width:72.0pt;border-top:none;border-left:none;border-bottom:
                                    solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;mso-border-top-alt:
                                    solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
                                    solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
                                    <p class=MsoNormal style='margin-right:10pt;text-align:center;tab-stops:
                                       36.0pt 54.15pt 72.3pt 90.45pt 108.6pt 126.7pt'><b><span style='font-size:16px;font-family:
                                               "Arial",sans-serif'><span style='mso-spacerun:yes'>   </span>ΛΗΞΗ<o:p></o:p></span></b></p>
                                    <p class=MsoNormal style='text-align:center;tab-stops:
                                       36.0pt 54.15pt 72.3pt 90.45pt 108.6pt 126.7pt'><b><span style='font-size:16px;font-family:
                                               "Arial",sans-serif'>ΙΣΧΥΟΣ(α)</span></b><b style='mso-bidi-font-weight:normal'><span
                                                style='font-family:"Arial",sans-serif'><o:p></o:p></span></b></p>
                                </td>

                                <!---------------------------------------------------------------------------------------------------------------------------------------->         

                                <td width=98 rowspan=2 valign=top style='width:73.7pt;border-top:none;
                                    border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                                    mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
                                    mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
                                    <p class=MsoNormal style='text-align:center;tab-stops:
                                       36.0pt 54.15pt 72.3pt 90.45pt 108.6pt 126.7pt'><b><span style='font-size:16px;font-family:
                                               "Arial",sans-serif'>ΠΑΡ/ΣΕΙΣ<br><br>∅<o:p></o:p></span></b></p>
                                </td>
                            </tr>
                            <!---------------------------------------------------------------------------------------------------------------------------------------->         
                            <tr style='mso-yfti-irow:5;height:50pt'>

                                <td width=156 style='width:117.0pt;border:solid windowtext 1.0pt;border-top:
                                    none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
                                    padding:0cm 5.4pt 0cm 5.4pt'>
                                    <p class=MsoNormal style='text-align:center;tab-stops:
                                       36.0pt 54.15pt 72.3pt 90.45pt 108.6pt 126.7pt'><b style='mso-bidi-font-weight:
                                         normal'><span style='font-family:"Arial",sans-serif'>ΤΑΚΤΙΚΗ<o:p>&nbsp;</o:p></span></b></p>
                                </td>


                                <td width=132 colspan=2 style='width:99.0pt;border-top:none;border-left:none;
                                    border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                                    mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
                                    mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
                                    <p class=MsoNormal style='text-align:center;tab-stops:
                                       36.0pt 54.15pt 72.3pt 90.45pt 108.6pt 126.7pt'><b style='mso-bidi-font-weight:
                                         normal'><span style='font-family:"Arial",sans-serif'>${elementsPDF.getOnJobGrade()}<o:p>&nbsp;</o:p></span></b></p>
                                </td>


                                <td width=139 style='width:104.4pt;border-top:none;border-left:none;
                                    border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
                                    mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
                                    mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
                                    <p class=MsoNormal style='text-align:center;tab-stops:
                                       36.0pt 54.15pt 72.3pt 90.45pt 108.6pt 126.7pt'><b style='mso-bidi-font-weight:
                                         normal'><span style='font-family:"Arial",sans-serif'><o:p>&nbsp;</o:p>${elementsPDF.getOnJobDate()}</span></b></p>
                                </td>


                                <td width=96 style='width:72.0pt;border-top:none;border-left:none;border-bottom:
                                    solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;mso-border-top-alt:
                                    solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
                                    solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
                                    <p class=MsoNormal style='text-align:center;tab-stops:
                                       36.0pt 54.15pt 72.3pt 90.45pt 108.6pt 126.7pt'><b style='mso-bidi-font-weight:
                                         normal'><span style='font-family:"Arial",sans-serif'>Ένα (1) Έτος<o:p>&nbsp;</o:p></span></b></p>
                                </td>
                            </tr>
                            <!---------------------------------------------------------------------------------------------------------------------------------------->         
                            <tr style='mso-yfti-irow:6;height:50pt'>

                                <td width=621 colspan=6 style='width:466.1pt;border:solid windowtext 1.0pt;
                                    border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
                                    padding:0cm 5.4pt 0cm 5.4pt;height:32.0pt'>

                                    <p class=MsoNormal style='margin-right:-34.7pt;text-align:justify;tab-stops:
                                       36.0pt 54.15pt 72.3pt 90.45pt 108.6pt 126.7pt'><b style='mso-bidi-font-weight:
                                         normal'><span style='font-family:"Arial",sans-serif'>ΕΠΙΠΡΟΣΘΕΤΗ ΕΚΠΑΙΔΕΥΣΗ:<o:p></o:p></span></b></p>



                                    <p class=MsoNormal style='margin-right:-34.7pt;text-align:center;tab-stops:
                                       36.0pt 54.15pt 72.3pt 90.45pt 108.6pt 126.7pt'><b style='mso-bidi-font-weight:
                                         normal'><span style='font-size:18px;font-family:"Arial",sans-serif'>ΔΕΝ ΑΠΑΙΤΕΙΤΑΙ<o:p>&nbsp;</o:p></span></b></p>
                                </td>
                            </tr>
                            <!---------------------------------------------------------------------------------------------------------------------------------------->        

                            <!---------------------------------------------------------------------------------------------------------------------------------------->         
                            <tr style='mso-yfti-irow:6;height:50pt'>

                                <td width=621 colspan=6 style='width:466.1pt;border:solid windowtext 1.0pt;
                                    border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
                                    padding:0cm 5.4pt 0cm 5.4pt;height:32.0pt'>
                                    <p class=MsoNormal style='margin-right:-34.7pt;text-align:justify;tab-stops:
                                       36.0pt 54.15pt 72.3pt 90.45pt 108.6pt 126.7pt'><b style='mso-bidi-font-weight:
                                         normal'><span style='font-family:"Arial",sans-serif'>ΤΕΛΙΚΟΣ ΧΑΡΑΚΤΗΡΙΣΜΟΣ:<o:p></o:p></span></b></p>

                                    <p class=MsoNormal style='margin-right:-34.7pt;text-align:center;tab-stops:
                                       36.0pt 54.15pt 72.3pt 90.45pt 108.6pt 126.7pt'><b style='mso-bidi-font-weight:
                                         normal'><span style='font-size:18px;font-family:"Arial",sans-serif'>ΕΠΙΤΥΧΩΝ<o:p>&nbsp;</o:p></span></b></p>
                                </td>
                            </tr>


                            <!---------------------------------------------------------------------------------------------------------------------------------------->
                            <tr style='mso-yfti-irow:9;mso-yfti-lastrow:yes;height:200pt'>


                                <td width=621 colspan=6 style='width:466.1pt;border:solid windowtext 1.0pt;
                                    border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
                                    padding:0cm 3pt 0cm 3pt;'>




                                    <p class=MsoNormal style='float:left;margin-left:4em;padding-top:-50px;text-align:center;'>
                                        <b style='mso-bidi-font-weight:normal'><span style='font-family:"Arial",sans-serif'>
                                                -Ο-<br>ΑΞΙΟΛΟΓΗΤΗΣ<br><br><%=userInSession.getName()%>&nbsp;<%=userInSession.getSurname()%><br><%=userInSession.getRank()%></span></b>
                                    </p>




                                    <p class=MsoNormal style='margin-right:4em;float:right;text-align:center;'><b style='mso-bidi-font-weight:
                                                                                                                  normal'><span style='font-family:"Arial",sans-serif'>
                                                -Ο-<br>ΑΞΙΟΛΟΓΟΥΜΕΝΟΣ<br><br>${elementsPDF.getName()} ${elementsPDF.getSurname()}<br>${elementsPDF.getRank()}<o:p></o:p></span></b>
                                    </p>




                                    <!--ΓΙΑ ΝΑ ΜΠΟΥΝ ΚΕΝΑ ΣΤΟ ΕΓΓΡΑΦΟ-->
                                    <p class=MsoNormal style='margin-top: 5px;margin-right:-34.7pt;text-align:center;tab-stops:
                                       36.0pt 54.15pt 72.3pt 90.45pt 108.6pt 126.7pt'><b style='mso-bidi-font-weight:
                                         normal'><span style='font-family:"Arial",sans-serif'><span
                                                    style='mso-spacerun:yes'>                                                                                  
                                                </span><o:p></o:p></span></b></p>
                                    <p class=MsoNormal style='margin-top: 5px;margin-right:-34.7pt;text-align:center;tab-stops:
                                       36.0pt 54.15pt 72.3pt 90.45pt 108.6pt 126.7pt'><b style='mso-bidi-font-weight:
                                         normal'><span style='font-family:"Arial",sans-serif'><span
                                                    style='mso-spacerun:yes'>                                                                                  
                                                </span><o:p></o:p></span></b></p>
                                    <p class=MsoNormal style='margin-top: 5px;margin-right:-34.7pt;text-align:center;tab-stops:
                                       36.0pt 54.15pt 72.3pt 90.45pt 108.6pt 126.7pt'><b style='mso-bidi-font-weight:
                                         normal'><span style='font-family:"Arial",sans-serif'><span
                                                    style='mso-spacerun:yes'>                                                                                  
                                                </span><o:p></o:p></span></b></p>
                                                   <p class=MsoNormal style='margin-top: 5px;margin-right:-34.7pt;text-align:center;tab-stops:
                                                      36.0pt 54.15pt 72.3pt 90.45pt 108.6pt 126.7pt'><b style='mso-bidi-font-weight:
                                         normal'><span style='font-family:"Arial",sans-serif'><span
                                                    style='mso-spacerun:yes'>                                                                                  
                                                </span><o:p></o:p></span></b></p>
                                    <!---------------------------------------------------------------------------------------------------------------------------------------->          

                                </td>
                            </tr>
                            <div id="watermark" style="float:left;position:absolute;margin-top:3em;margin-left:2em;opacity:0.3;z-index: 99;color: black;-webkit-transform: rotate(-40deg);font-size: 80px;">ΑΜ:(${elementsPDF.getAm()})</div>
                        </table>

                    </div>
                </div>
                <!---------------------------------------------------------------------------------------------------------------------------------------->         
            </c:forEach>    
        </form>


        <!---------------------------------------------------------------------------------------------------------------------------------------->        


        <div>
            <button style="margin-top:3em;float:right;position:static;margin-right:40%;background-color:black;color: rgb(255, 255, 255);font-size: 20px;" id="btnExport" onclick="generatePDF()">Αποθήκευση Τελικής Φόρμας</button>
        </div>            

        <script>
            function validate() {

                var myButton = document.getElementById('btnExport');


                myButton.style.display = 'none';


                setTimeout(function () {
                    myButton.style.display = 'inline';

                }, 5000);

            }
        </script>

        <script>
            function generatePDF() {
                setTimeout(function () {
                    const element = document.getElementById("target");

                    html2pdf()
                            .from(element)
                            .save("evaluation.pdf");

                }, (3000));
            }
            ;
        </script>

        <script type="text/javascript">
            var button = document.getElementById('btnExport')
            button.addEventListener('click', hideshow, false);

            function hideshow() {
                document.getElementById('btnExport').style.display = 'block';
                this.style.display = 'none'
            }
        </script>


    </body>

</html>

