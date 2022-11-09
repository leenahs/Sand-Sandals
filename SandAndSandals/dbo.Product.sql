CREATE TABLE [dbo].[Product] (
    [IdP]       INT            IDENTITY (1, 1) NOT NULL,
    [TitleP]      NVARCHAR (100) NOT NULL,
    [PriceP]    INT            NOT NULL,
    [QtyP]      INT            NOT NULL,
    [photoPath] NVARCHAR (MAX) NULL
    PRIMARY KEY CLUSTERED ([IdP] ASC)
);

