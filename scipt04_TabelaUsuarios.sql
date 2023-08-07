BEGIN TRANSACTION;
GO

DECLARE @var0 sysname;
SELECT @var0 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Usuarios]') AND [c].[name] = N'Perfil');
IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [Usuarios] DROP CONSTRAINT [' + @var0 + '];');
ALTER TABLE [Usuarios] ADD DEFAULT N'Jogador' FOR [Perfil];
GO

ALTER TABLE [Personagens] ADD [FotoPersonagem] varbinary(max) NULL;
GO

ALTER TABLE [Personagens] ADD [usuarioId] int NULL;
GO

CREATE TABLE [TB_Disputas] (
    [Id] int NOT NULL IDENTITY,
    [Dt_Disputa] datetime2 NULL,
    [AtacanteId] int NOT NULL,
    [OponenteId] int NOT NULL,
    [Tx_Narracao] nvarchar(max) NULL,
    CONSTRAINT [PK_TB_Disputas] PRIMARY KEY ([Id])
);
GO

UPDATE [Personagens] SET [FotoPersonagem] = NULL, [usuarioId] = NULL
WHERE [Id] = 1;
SELECT @@ROWCOUNT;

GO

UPDATE [Personagens] SET [FotoPersonagem] = NULL, [usuarioId] = NULL
WHERE [Id] = 2;
SELECT @@ROWCOUNT;

GO

UPDATE [Personagens] SET [FotoPersonagem] = NULL, [usuarioId] = NULL
WHERE [Id] = 3;
SELECT @@ROWCOUNT;

GO

UPDATE [Personagens] SET [FotoPersonagem] = NULL, [usuarioId] = NULL
WHERE [Id] = 4;
SELECT @@ROWCOUNT;

GO

UPDATE [Personagens] SET [FotoPersonagem] = NULL, [usuarioId] = NULL
WHERE [Id] = 5;
SELECT @@ROWCOUNT;

GO

UPDATE [Personagens] SET [FotoPersonagem] = NULL, [usuarioId] = NULL
WHERE [Id] = 6;
SELECT @@ROWCOUNT;

GO

UPDATE [Personagens] SET [FotoPersonagem] = NULL, [usuarioId] = NULL
WHERE [Id] = 7;
SELECT @@ROWCOUNT;

GO

CREATE INDEX [IX_Personagens_usuarioId] ON [Personagens] ([usuarioId]);
GO

ALTER TABLE [Personagens] ADD CONSTRAINT [FK_Personagens_Usuarios_usuarioId] FOREIGN KEY ([usuarioId]) REFERENCES [Usuarios] ([Id]);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20230731120708_MigracaoUsuario', N'7.0.4');
GO

COMMIT;
GO

