# Project Description

## Objective
The objective of this project is the development of an Integrated Information System for the Annual Evaluation of the Army Staff, utilizing Information Technology. The aim is to digitize the annual evaluation process, reduce the time of the personnel responsible for its execution, and eliminate the large volume of printouts consumed.

## Analysis of Requirements

### Operational Requirements
- All registered users must sign in before using the services of the Information System.
- The system will randomly draw 50 questions from a total of 150 questions for each specialty.
- Assessed staff can answer the 50 questions of their theoretical assessment through the online platform.
- After the assessed staff submit their answers, the system will calculate the assessment score.
- Assessed staff may save the scored theoretical assessment on their local file system.
- Assessed staff can view the history of their assessments.
- Assessors can monitor the progress of theoretical assessments of the assessed staff in their unit.
- Assessors can grade the field-based practical examination of the assessed staff on the online platform.
- The system will calculate the final score as the average of the theoretical and practical training.
- Assessors can review frequent errors and other details concerning the progress of the assessment process through charts.

### Non-operational Requirements
- System response time shall not exceed 3 seconds, even when serving 20 evaluators simultaneously.
- The system shall be continuously operational (24/7) and shall not crash more than twice a year.
- System restart time after any interruption shall not exceed 3 minutes.
- Personal data of assessed staff shall be protected by login and password identification. Only assessors may access the examination results of the assessed staff in their unit.
- Disk space for each assessed staff shall not exceed 10 KB.
- The examination duration shall be 1 hour, and assessed staff may take the examination once a year within a specified range of days.
- The system shall provide the possibility of recording and storing locally (download) the file of the theoretical assessment of the assessed staff in .pdf format.
- An overview of the progress of the assessed staff's assessment will be provided to the assessor using statistics and graphs.
- The provided procedure shall not reduce the quality of the hitherto performed annual evaluation process of the executives.
- Learning the system should not require more than 4 hours of training.

## Database (ER Model)
![image](https://github.com/CodeNinjaTech/Java-Web-App-For-Military-Staff-Evaluation/assets/143879796/2cf1e6f3-4008-4256-b556-2d8dac322e38)

## Technologies Used
![image](https://github.com/CodeNinjaTech/Java-Web-App-For-Military-Staff-Evaluation/assets/143879796/0bf6e932-9aa6-4858-abd1-843f96ce1377)

## Operation of the Theoretical Assessment (Single Page Application)
![image](https://github.com/CodeNinjaTech/Java-Web-App-For-Military-Staff-Evaluation/assets/143879796/22f0d804-763b-4165-9196-a06ef068265a)
