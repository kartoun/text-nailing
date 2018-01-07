CREATE Function [dbo].[GetSmokingStatus](@InputTextBlob VarChar(max))
Returns VarChar(max)
AS
Begin
    Declare @Result as varchar(50) = 'Unknown'  
    
    Declare @InputTextBlob_OnlyLetters as varchar(max)
    Set @InputTextBlob_OnlyLetters = dbo.RemoveNonAlphaCharacters(@InputTextBlob)
    
     If @InputTextBlob_OnlyLetters like '%Quitsmoking%' or     
		@InputTextBlob_OnlyLetters like '%Pastsmok%' or
		@InputTextBlob_OnlyLetters like '%SmokedP%' or
		@InputTextBlob_OnlyLetters like '%smokingquit%' or
		@InputTextBlob_OnlyLetters like '%tobaccoquit%' or
		@InputTextBlob_OnlyLetters like '%hesmoked%' or
		@InputTextBlob_OnlyLetters like '%exsmoker%' or
		@InputTextBlob_OnlyLetters like '%quittobacco%' or
		@InputTextBlob_OnlyLetters like '%usedtosmoke%' or
		@InputTextBlob_OnlyLetters like '%shesmoked%' or
		@InputTextBlob_OnlyLetters like '%smokedpack%' or
		@InputTextBlob_OnlyLetters like '%smokedcigarettes%' or
		@InputTextBlob_OnlyLetters like '%hasnotsmokedsince%' or
		@InputTextBlob_OnlyLetters like '%wasasmoker%' or
		@InputTextBlob_OnlyLetters like '%smokedpacks%' or
		@InputTextBlob_OnlyLetters like '%smokedinthepast%'
        Set @Result='Past'
        
     Else If @InputTextBlob_OnlyLetters like '%currentsmoker%' or
 			 @InputTextBlob_OnlyLetters like '%continuestosmoke%' or
			 @InputTextBlob_OnlyLetters like '%smokingPPD%' or
			 @InputTextBlob_OnlyLetters like '%smokesPPD%' or
			 @InputTextBlob_OnlyLetters like '%smokerppd%' or
			 @InputTextBlob_OnlyLetters like '%hesmokes%' or
			 @InputTextBlob_OnlyLetters like '%stillsmokes%' or
			 @InputTextBlob_OnlyLetters like '%shesmokes%' or
			 @InputTextBlob_OnlyLetters like '%activesmoker%' or
			 @InputTextBlob_OnlyLetters like '%ppdsmoker%' or
			 @InputTextBlob_OnlyLetters like '%currentlysmokes%' or
			 @InputTextBlob_OnlyLetters like '%tobaccopackday%' or
			 @InputTextBlob_OnlyLetters like '%doessmoke%' or
			 @InputTextBlob_OnlyLetters like '%patientsmokes%'
		Set @Result='Current'
		
		Else If @InputTextBlob_OnlyLetters like '%doesnotsmoke%' or
				@InputTextBlob_OnlyLetters like '%nonsmoker%' or
				@InputTextBlob_OnlyLetters like '%tobacconone%' or
				@InputTextBlob_OnlyLetters like '%neverasmoker%' or
				@InputTextBlob_OnlyLetters like '%smokerNo%' or
				@InputTextBlob_OnlyLetters like '%neversmoke%' or
				@InputTextBlob_OnlyLetters like '%smokeNo%' or
				@InputTextBlob_OnlyLetters like '%nosmoke%' or
				@InputTextBlob_OnlyLetters like '%notasmoker%' or
				@InputTextBlob_OnlyLetters like '%doesntsmoke%'
		Set @Result='Never'
		
		

    Return @Result
End


GO


