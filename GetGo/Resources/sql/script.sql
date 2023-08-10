USE [db_Getgo]
GO
/****** Object:  StoredProcedure [dbo].[APP_PROFILE_ATTACHMENT_INSERT]    Script Date: 8/9/2023 3:40:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[APP_PROFILE_ATTACHMENT_INSERT]
@USER_ID NVARCHAR(50),
@DESCRIPTION   NVARCHAR(MAX),
@IMAGE_TYPE  NVARCHAR(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
DECLARE @ATTACHMENT NVARCHAR(MAX);

SET @ATTACHMENT = (
SELECT TOP 1
     DESCRIPTION as PROFILE_IMAGE
	FROM TBL_M_USER_MASTER_ATTACHMENT 
	
	WHERE USER_ID= @USER_ID AND IMAGE_TYPE =@IMAGE_TYPE)
	 IF @ATTACHMENT IS NULL
    BEGIN
        INSERT INTO TBL_M_USER_MASTER_ATTACHMENT (USER_ID, DESCRIPTION, IMAGE_TYPE)
        VALUES (@USER_ID, @DESCRIPTION, @IMAGE_TYPE);
    END
    ELSE
    BEGIN
        UPDATE TBL_M_USER_MASTER_ATTACHMENT
        SET DESCRIPTION = @DESCRIPTION
        WHERE USER_ID = @USER_ID AND IMAGE_TYPE=@IMAGE_TYPE;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[APP_PROFILE_GET]    Script Date: 8/9/2023 3:40:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[APP_PROFILE_GET]
@INPUT NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	WITH PIC_PROFILE AS (
	SELECT
	a.USER_ID
     ,a.USER_ID + '/'+b.DESCRIPTION as PROFILE_IMAGE
	FROM TBL_M_USER_MASTER_ATTACHMENT 
	AS B LEFT JOIN TBL_M_USER_MASTER as A ON a.USER_ID = B.USER_ID
	WHERE a.USER_ID= @INPUT AND B.IMAGE_TYPE ='PROFILE'
	)
SELECT
a.[USER_ID]
,b.PROFILE_IMAGE
      ,[FIRST_NAME]
      ,[MIDDLE_NAME]
      ,[LAST_NAME]
      ,[EXTENSION_NAME]
      ,[AGE]
      ,[DATE_OF_BIRTH]
      ,[SEX]
      ,[MARITAL_STATUS]
      ,[SPOUSE_NAME]
      ,[USERNAME]
      ,[PASSWORD]
      ,[EMAIL_ADDRESS]
      ,[CONTACTNO]
      ,[COMPANY_NAME]
      ,[REGION]
      ,[PROVINCE]
      ,[CITY]
      ,[BARANGAY]
      ,[STREET_NO]
      ,[ZIPCODE]
      ,[BUSSINESS_NAME]
      ,[NATURE_OF_WORK]
      ,[MONTHLY_GROSS]
      ,[CHARACTER_REFERENCE]
      ,[CO_GUARANTOR_NAME]
      ,[CO_GUARANTOR_NUMBER]
      ,[CREATED_BY]
      ,[CREATED_DATE]
      ,[UPDATED_BY]
      ,[UPDATED_DATE]
      ,[DELETE_FLAG]
      ,[ACTIVE_FLAG]

FROM TBL_M_USER_MASTER  AS A LEFT JOIN  PIC_PROFILE AS B ON a.USER_ID = b.USER_ID
WHERE a.USER_ID=@INPUT OR a.USERNAME = @INPUT
END
GO
/****** Object:  StoredProcedure [dbo].[APP_PROFILE_GET_USER_ID]    Script Date: 8/9/2023 3:40:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[APP_PROFILE_GET_USER_ID]
	@INPUT NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT USER_ID,USERNAME FROM TBL_M_USER_MASTER WHERE USERNAME=@INPUT OR USER_ID=@INPUT
END
GO
/****** Object:  StoredProcedure [dbo].[APP_PROFILE_UPDATE]    Script Date: 8/9/2023 3:40:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[APP_PROFILE_UPDATE]
@ACTION			NVARCHAR(50),
@USER_ID		NVARCHAR(50)=NULL,
@FIRST_NAME		NVARCHAR(50)=NULL,
@MIDDLE_NAME	NVARCHAR(50)=NULL,
@LAST_NAME		NVARCHAR(50)=NULL,
@DATE_OF_BIRTH	NVARCHAR(50)=NULL,
@SEX			NVARCHAR(50)=NULL,
@MARITAL_STATUS	NVARCHAR(50)=NULL,
@EMAIL_ADDRESS	NVARCHAR(50)=NULL,
@CONTACTNO		NVARCHAR(50)=NULL,
@REGION			NVARCHAR(50)=NULL,
@PROVINCE		NVARCHAR(50)=NULL,
@CITY			NVARCHAR(50)=NULL,
@BARANGAY		NVARCHAR(50)=NULL,
@STREET_NO		NVARCHAR(50)=NULL,
@ZIPCODE		NVARCHAR(50)=NULL


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
IF @ACTION='PRIMARY'
BEGIN
UPDATE TBL_M_USER_MASTER	

SET 
FIRST_NAME		=@FIRST_NAME	,	
MIDDLE_NAME		=@MIDDLE_NAME	,
LAST_NAME		=@LAST_NAME		,
DATE_OF_BIRTH	=@DATE_OF_BIRTH	,
SEX				=@SEX			,
CONTACTNO = @CONTACTNO,
MARITAL_STATUS	=@MARITAL_STATUS 
WHERE USER_ID =@USER_ID
END
IF @ACTION='SECONDARY'
BEGIN
UPDATE TBL_M_USER_MASTER 

SET 
REGION		=@REGION	,		
PROVINCE	=@PROVINCE	,	
CITY		=@CITY		,	
BARANGAY	=@BARANGAY	,	
STREET_NO	=@STREET_NO	,	
ZIPCODE		=@ZIPCODE		
WHERE USER_ID =@USER_ID
END
END
GO
-- =============================================
CREATE PROCEDURE [dbo].[APP_USER_PROFILE_GET]
@USER_ID NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT * FROM TBL_M_USER_MASTER WHERE USER_ID=@USER_ID
END
GO



















--==8/10/2023


------------------------------------------

USE [db_Getgo]
GO
/****** Object:  StoredProcedure [dbo].[APP_ATTACHMENT_POST]    Script Date: 8/10/2023 3:58:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[APP_ATTACHMENT_POST]
@USER_ID NVARCHAR(50),
@DESCRIPTION   NVARCHAR(MAX),
@IMAGE_TYPE  NVARCHAR(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
DECLARE @ATTACHMENT NVARCHAR(MAX);

SET @ATTACHMENT = (
SELECT TOP 1
     DESCRIPTION as PROFILE_IMAGE
	FROM TBL_M_USER_MASTER_ATTACHMENT 
	
	WHERE USER_ID= @USER_ID AND IMAGE_TYPE =@IMAGE_TYPE)
	 IF @ATTACHMENT IS NULL
    BEGIN
        INSERT INTO TBL_M_USER_MASTER_ATTACHMENT (USER_ID, DESCRIPTION, IMAGE_TYPE)
        VALUES (@USER_ID, @DESCRIPTION, @IMAGE_TYPE);
    END
    ELSE
    BEGIN
        UPDATE TBL_M_USER_MASTER_ATTACHMENT
        SET DESCRIPTION = @DESCRIPTION
        WHERE USER_ID = @USER_ID AND IMAGE_TYPE=@IMAGE_TYPE;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[APP_PROFILE_GET]    Script Date: 8/10/2023 3:58:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[APP_PROFILE_GET]
@INPUT NVARCHAR(50)
AS
BEGIN
    --DECLARE @INPUT NVARCHAR(50) = 'APP230807001';

    WITH AttachmentCTE AS (
        SELECT
            a.USER_ID,
            a.USER_ID + '/' + b.DESCRIPTION AS ATTACHMENT,
            b.IMAGE_TYPE
        FROM TBL_M_USER_MASTER_ATTACHMENT AS B WITH (NOLOCK)
        LEFT JOIN TBL_M_USER_MASTER AS A WITH (NOLOCK) ON A.USER_ID = B.USER_ID
        WHERE a.USER_ID = @INPUT
    )
    SELECT
        A.[USER_ID],
        P.ATTACHMENT AS PROFILE_IMAGE,
        F.ATTACHMENT AS FRONTFACE,
        B.ATTACHMENT AS BACKFACE,
        S.ATTACHMENT AS SIGNATURE_,
        [FIRST_NAME],
        [MIDDLE_NAME],
        [LAST_NAME],
        [EXTENSION_NAME],
        [AGE],
        [DATE_OF_BIRTH],
        [SEX],
        [MARITAL_STATUS],
        [SPOUSE_NAME],
        [USERNAME],
        [PASSWORD],
        [EMAIL_ADDRESS],
        [CONTACTNO],
        [COMPANY_NAME],
        [REGION],
        [PROVINCE],
        [CITY],
        [BARANGAY],
        [STREET_NO],
        [ZIPCODE],
        [BUSSINESS_NAME],
        [NATURE_OF_WORK],
        [MONTHLY_GROSS],
        [CHARACTER_REFERENCE],
        [CO_GUARANTOR_NAME],
        [CO_GUARANTOR_NUMBER],
        [CREATED_BY],
        [CREATED_DATE],
        [UPDATED_BY],
        [UPDATED_DATE],
        [DELETE_FLAG],
        [ACTIVE_FLAG]
    FROM TBL_M_USER_MASTER AS A WITH (NOLOCK)
    LEFT JOIN AttachmentCTE AS P ON A.USER_ID = P.USER_ID AND P.IMAGE_TYPE = 'PROFILE'
    LEFT JOIN AttachmentCTE AS F ON A.USER_ID = F.USER_ID AND F.IMAGE_TYPE = 'FRONTFACE'
    LEFT JOIN AttachmentCTE AS B ON A.USER_ID = B.USER_ID AND B.IMAGE_TYPE = 'BACKFACE'
    LEFT JOIN AttachmentCTE AS S ON A.USER_ID = S.USER_ID AND S.IMAGE_TYPE = 'SIGNATURE'
    WHERE a.USER_ID = @INPUT OR a.USERNAME = @INPUT
END
GO
/****** Object:  StoredProcedure [dbo].[APP_PROFILE_UPDATE]    Script Date: 8/10/2023 3:58:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[APP_PROFILE_UPDATE]
@ACTION			NVARCHAR(50),
@USER_ID		NVARCHAR(50),
@FIRST_NAME		NVARCHAR(50)=NULL,
@MIDDLE_NAME	NVARCHAR(50)=NULL,
@LAST_NAME		NVARCHAR(50)=NULL,
@DATE_OF_BIRTH	NVARCHAR(50)=NULL,
@SEX			NVARCHAR(50)=NULL,
@MARITAL_STATUS	NVARCHAR(50)=NULL,
@EMAIL_ADDRESS	NVARCHAR(50)=NULL,
@CONTACTNO		NVARCHAR(50)=NULL,
@REGION			NVARCHAR(50)=NULL,
@PROVINCE		NVARCHAR(50)=NULL,
@CITY			NVARCHAR(50)=NULL,
@BARANGAY		NVARCHAR(50)=NULL,
@STREET_NO		NVARCHAR(50)=NULL,
@ZIPCODE		NVARCHAR(50)=NULL


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
IF @ACTION='PRIMARY'
BEGIN
UPDATE TBL_M_USER_MASTER	

SET 
FIRST_NAME		=@FIRST_NAME	,	
MIDDLE_NAME		=@MIDDLE_NAME	,
LAST_NAME		=@LAST_NAME		,
DATE_OF_BIRTH	=@DATE_OF_BIRTH	,
SEX				=@SEX			,
CONTACTNO = @CONTACTNO,
MARITAL_STATUS	=@MARITAL_STATUS 
WHERE USER_ID =@USER_ID
END
IF @ACTION='SECONDARY'
BEGIN
UPDATE TBL_M_USER_MASTER 

SET 
REGION		=@REGION	,		
PROVINCE	=@PROVINCE	,	
CITY		=@CITY		,	
BARANGAY	=@BARANGAY	,	
STREET_NO	=@STREET_NO	,	
ZIPCODE		=@ZIPCODE		
WHERE USER_ID =@USER_ID
END
END
GO
/****** Object:  StoredProcedure [dbo].[APP_USER_PROFILE_GET]    Script Date: 8/10/2023 3:58:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[APP_USER_PROFILE_GET]
@USER_ID NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT * FROM TBL_M_USER_MASTER WHERE USER_ID=@USER_ID
END
GO
/****** Object:  StoredProcedure [dbo].[USP_APP_SIGNUP_CREATE_OR_UPDATE]    Script Date: 8/10/2023 3:58:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[USP_APP_SIGNUP_CREATE_OR_UPDATE]
	@USERNAME NVARCHAR(50),
	@EMAIL NVARCHAR(50),
	@PHONENUMBER INT,
	@PASSWORD NVARCHAR(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
INSERT INTO TBL_M_USER_MASTER (USERNAME,EMAIL_ADDRESS,CONTACTNO,PASSWORD) VALUES(@USERNAME,@EMAIL,@PHONENUMBER,@PASSWORD)
END
GO
