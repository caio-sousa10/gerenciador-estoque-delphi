object DM: TDM
  Height = 480
  Width = 640
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=gerenciador_estoque'
      'User_Name=postgres'
      'Password=myadmin'
      'Server=127.0.0.1'
      'DriverID=PG')
    Connected = True
    Left = 272
    Top = 136
  end
  object qryProdutos: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from produtos;')
    Left = 408
    Top = 136
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files\PostgreSQL\18\bin\libpq.dll'
    Left = 272
    Top = 40
  end
  object DsProdutos: TDataSource
    DataSet = qryProdutos
    Left = 408
    Top = 40
  end
end
