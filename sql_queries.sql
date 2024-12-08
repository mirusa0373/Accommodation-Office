--Below lists the room details from a LocationNumber that URN (User inputs their URN) is assigned to:
SELECT Room_Number, Floor, Block, Campus FROM Room 
WHERE LocationNumber IN
(SELECT LocationNumber FROM Lease
WHERE URN =
(SELECT URN FROM Student
WHERE URN = 'User Input'));

--Below lists the total number of occupants accomodating.
SELECT SUM(Number_Of_Occupants) FROM Room;

--Below selects the students with the same phone number as the emergency contacts:
SELECT * FROM Student
INNER JOIN Emergency_Contact
ON Student.Stu_Phone = Emergency_Contact.EC_Phone;
