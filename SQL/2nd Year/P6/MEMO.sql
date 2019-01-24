USE DBSocialHire
GO


--------- Question 1 Suggested Solution --------

SELECT * FROM Item

PIVOT (COUNT([Client_ID]) FOR [Client_ID] IN

([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14])) p


--------- Question 2 Suggested Solution --------

SELECT * FROM (SELECT Item_Name, [Client_ID] FROM Item ) o

PIVOT (COUNT([Client_ID]) FOR [Client_ID] IN

([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14])) p


--------- Question 3 Suggested Solution --------

SELECT Item_Name,
[1] AS [Carmen Jeppe],
[2] AS [Joan Serah],
[3] AS [Leah Louw],
[4] AS [Donald Duck],
[5] AS [Kerri Fischer],
[6] AS [Thembi Nkosi],
[7] AS [Cecil Rhodes],
[8] AS [Phineas Serah],
[9] AS [Ferb Serah],
[10] AS [Dorah Explorer],
[11] AS [Humpty Dumpty],
[12] AS [John Pierre],
[13] AS [ Louis Lane],
[14] AS [Mark Diesel]

FROM (SELECT Item_Name, [Client_ID] FROM Item ) o
PIVOT (COUNT([Client_ID]) FOR [Client_ID] in

([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14])) p














