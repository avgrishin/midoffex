inherited fSpravADO1: TfSpravADO1
  Left = 498
  Top = 119
  BorderIcons = [biSystemMenu]
  Caption = 'fSpravADO1'
  PixelsPerInch = 96
  TextHeight = 13
  inherited AvEhGrid1: TAvEhGrid
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghEnterAsTab, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghDblClickOptimizeColWidth, dghDialogFind, dghColumnResize, dghColumnMove]
    OnEnter = AvEhGrid1Enter
    OnExit = AvEhGrid1Exit
  end
  inherited TBXDock2: TTBXDock
    inherited TBXToolbar2: TTBXToolbar
      object TBXItem5: TTBXItem
        Action = acAll1
      end
    end
  end
  inherited q1: TADOQuery
    BeforeOpen = q1BeforeOpen
  end
  inherited ActionList1: TActionList
    object acAll1: TAction
      Caption = #1042#1089#1077
      Enabled = False
      OnExecute = acAll1Execute
      OnUpdate = acAll1Update
    end
  end
  inherited FormPlacement1: TFormPlacement
    Active = True
    Options = [fpPosition]
    UseRegistry = True
  end
  object qDescr: TADOQuery
    Connection = DM1.ADOConnection1
    Parameters = <
      item
        Name = 'concept'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select info from taLibDesc where concept = :concept')
    Left = 352
    Top = 192
  end
  object XmlDoc1: TFreeThreadedDOMDocument
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 384
    Top = 192
  end
end
