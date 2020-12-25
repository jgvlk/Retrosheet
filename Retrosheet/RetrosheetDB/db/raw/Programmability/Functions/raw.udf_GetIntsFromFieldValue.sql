CREATE FUNCTION [raw].[udf_GetIntFromFieldValue]
(
    @strAlphaNumeric NVARCHAR(500)
)
RETURNS NVARCHAR(500)
AS
BEGIN

    DECLARE @intAlpha INT
    SET @intAlpha = PATINDEX('%[^0-9]%', @strAlphaNumeric)
    BEGIN
        WHILE @intAlpha > 0
        BEGIN
            SET @strAlphaNumeric = STUFF(@strAlphaNumeric, @intAlpha, 1, '')
            SET @intAlpha = PATINDEX('%[^0-9]%', @strAlphaNumeric)
        END
    END

RETURN ISNULL(@strAlphaNumeric,0)

END
GO

