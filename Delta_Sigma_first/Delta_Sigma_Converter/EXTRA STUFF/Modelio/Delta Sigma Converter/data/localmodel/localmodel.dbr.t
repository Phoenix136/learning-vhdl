`h�0  P               G              F                                                      �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     �0  R                �� l    
  �   ORMAT_VERSION!�   �    ! &�   able_String! fFORMAT_VERSION!�   �    * /�   able_String! fmain!fFORMAT_VERSION!�   o�� sr jdbm.btree.BTree{G��rߴ  xpsr  jdbm.helper.ComparableComparatorJ˼���  xpw                    xo 7 <�   sersV16!ftable_String! fmain!fFORMAT_VERSION!���o�g3:W<?xml version="1.0" encoding="UTF-8"?>
<metamodel format="1" MetamodelDescriptor.format="1">
  <fragment name="Infrastructure" version="2.1.03" provider="Modeliosoft" providerVersion="3.8.01">
    <dependencies>
      <metamodel_fragment name="modelio.kernel" version="1.0.00"/>
    </dependencies>
    <metaclasses>
      <metaclass name="AbstractDiagram" version="0.0.9054" abstract="true">
        <parent fragment="Infrastructure" name="ModelElement"/>
        <attribute name="UiDataVersion" type="java.lang.Integer"></attribute>
        <attribute name="UiData" type="java.lang.String"></attribute>
        <attribute name="PreviewData" type="java.lang.String"></attribute>
        <dependency name="Represented" min="0" max="-1" navigate="true" weakReference="true">
          <target fragment="Infrastructure" name="Element"/>
          <opposite name="DiagramElement"/>
        </dependency>
        <dependency name="ReferencingSet" min="0" max="-1" navigate="false">
          <target fragment="Infrastructure" name="DiagramSet"/>
          <opposite name="ReferencedDiagram"/>
        </dependency>
        <dependency name="Origin" min="0" max="1" navigate="true">
          <target fragment="Infrastructure" name="ModelElement"/>
          <opposite name="Product"/>
        </dependency>
      </metaclass>
      <metaclass name="AbstractProject" version="3.6.00" abstract="true">
        <parent fragment="Infrastructure" name="ModelElement"/>
        <dependency name="DiagramRoot" min="1" max="1" aggregation="Composition" navigate="true">
          <target fragment="Infrastructure" name="DiagramSet"/>
          <opposite name="Owner"/>
        </dependency>
      </metaclass>
      <metaclass name="AbstractResource" version="2.1.00">
        <parent fragment="Infrastructure" name="ModelElement"/>
        <attribute name="MimeType" type="java.lang.String"></attribute>
        <attribute name="StorageInfo" type="java.lang.String"></attribute>
        <dependency name="Type" min="1" max="1" navigate="true">
          <target fragment="Infrastructure" name="ResourceType"/>
          <opposite name="TypedResource"/>
        </dependency>
        <dependency name="Subject" min="0" max="1" navigate="false">
          <target fragment="Infrastructure" name="ModelElement"/>
          <opposite name="Attached"/>
        </dependency>
      </metaclass>
      <link_metaclass name="Dependency" version="0.0.9054">
        <parent fragment="Infrastructure" name="ModelElement"/>
        <dependency name="Impacted" min="1" max="1" navigate="false">
          <target fragment="Infrastructure" name="ModelElement"/>
          <opposite name="DependsOnDependency"/>
        </dependency>
        <dependency name="DependsOn" min="0" max="1" navigate="true">
          <target fragment="Infrastructure" name="ModelElement"/>
          <opposite name="ImpactedDependency"/>
        </dependency>
        <sources>
          <dep name="Impacted"/>
        </sources>
        <targets>
          <dep name="DependsOn"/>
        </targets>
      </link_metaclass>
      <metaclass name="DiagramSet" version="0.0.9054" cmsNode="true">
        <parent fragment="Infrastructure" name="ModelElement"/>
        <dependency name="Sub" min="0" max="-1" aggregation="Composition" navigate="true">
          <target fragment="Infrastructure" name="DiagramSet"/>
          <opposite name="Parent"/>
        </dependency>
        <dependency name="Parent" min="0" max="1" navigate="false">
          <target fragment="Infrastructure" name="DiagramSet"/>
          <opposite name="Sub"/>
        </dependency>
        <dependency name="ReferencedDiagram" min="0" max="-1" navigate="true">
          <target fragment="Infrastructure" name="AbstractDiagram"/>
          <opposite name="ReferencingSet"/>
        </dependency>
        <dependency name="Owner" min="0" max="1" navigate="false">
          <target fragment="Infrastructure" name="AbstractProject"/>
          <opposite name="DiagramRoot"/>
        </dependency>
      </metaclass>
      <metaclass name="Document" version="2.1.00" cmsNode="true">
        <parent fragment="Infrastructure" name="AbstractResource"/>
        <attribute name="Abstract" type="java.lang.String"></attribute>
      </metaclass>
      <metaclass name="DynamicPropertyDefinition" version="1.1.01">
        <parent fragment="Infrastructure" name="PropertyDefinition"/>
      </metaclass>
      <metaclass name="Element" version="0.0.9054" abstract="true">
        <parent fragment="modelio.kernel" name="SmObject"/>
        <dependency name="DiagramElement" min="0" max="-1" navigate="false">
          <target fragment="Infrastructure" name="AbstractDiagram"/>
          <opposite name="Represented"/>
        </dependency>
        <dependency name="AddedToQuery" min="0" max="-1" navigate="false">
          <target fragment="Infrastructure" name="QueryDefinition"/>
          <opposite name="Added"/>
        </dependency>
        <dependency name="causedImpact" min="0" max="-1" navigate="false">
          <target fragment="Infrastructure" name="ImpactLink"/>
          <opposite name="causes"/>
        </dependency>
      </metaclass>
      <metaclass name="EnumeratedPropertyType" version="0.0.9054" cmsNode="true">
        <parent fragment="Infrastructure" name="PropertyType"/>
        <dependency name="Litteral" min="0" max="-1" aggregation="Composition" navigate="true">
          <target fragment="Infrastructure" name="PropertyEnumerationLitteral"/>
          <opposite name="Owner"/>
        </dependency>
        <dependency name="OccurenceConfigParam" min="0" max="-1" navigate="false">
          <target fragment="Infrastructure" name="ModuleParameter"/>
          <opposite name="EnumType"/>
        </dependency>
      </metaclass>
      <metaclass name="ExternElement" version="0.0.00">
        <parent fragment="Infrastructure" name="ModelElement"/>
        <attribute name="Provider" type="java.lang.String"></attribute>
        <attribute name="ExternId" type="java.lang.String"></attribute>
        <attribute name="Location" type="java.lang.String"></attribute>
        <dependency name="Owner" min="1" max="1" navigate="false">
          <target fragment="Infrastructure" name="MethodologicalLink"/>
          <opposite name="ExternElement"/>
        </dependency>
      </metaclass>
      <metaclass name="ExternProcessor" version="0.0.9054">
        <parent fragment="Infrastructure" name="ModelElement"/>
        <attribute name="ClassName" type="java.lang.String"></attribute>
        <dependency name="OwnerQuery" min="0" max="1" navigate="false">
          <target fragment="Infrastructure" name="QueryDefinition"/>
          <opposite name="Processor"/>
        </dependency>
        <dependency name="OwnerValDef" min="0" max="1" navigate="false">
          <target fragment="Infrastructure" name="MatrixValueDefinition"/>
          <opposite name="Processor"/>
        </dependency>
      </metaclass>
      <metaclass name="GraphDiagram" version="2.1.02" cmsNode="true">
        <parent fragment="Infrastructure" name="AbstractDiagram"/>
      </metaclass>
      <metaclass name="ImpactDiagram" version="3.6.00" cmsNode="true">
        <parent fragment="Infrastructure" name="AbstractDiagram"/>
      </metaclass>
      <link_metaclass name="ImpactLink" version="3.6.00">
        <parent fragment="Infrastructure" name="ModelElement"/>
        <dependency name="dependsOn" min="1" max="1" navigate="true">
          <target fragment="Infrastructure" name="ModelElement"/>
          <opposite name="impactImpacted"/>
        </dependency>
        <dependency name="impacted" min="1" max="1" navigate="true">
          <target fragment="Infrastructure" name="ModelElement"/>
          <opposite name="impactDependsOn"/>
        </dependency>
        <dependency� B0  R       C       A"e="SEQOP"/>
        <value name="ALTOP"/>
        <value name="OPTOP"/>
        <value name="BREAKOP"/>
        <value name="PAROP"/>
        <value name="STRICTOP"/>
        <value name="LOOPOP"/>
        <value name="CRITICALOP"/>
        <value name="NEGOP"/>
        <value name="ASSERTOP"/>
        <value name="IGNOREOP"/>
        <value name="CONSIDEROP"/>
      </enumeration>
      <enumeration name="org.modelio.metamodel.uml.behavior.interactionModel.MessageKind">
        <value name="COMPLETEKIND"/>
        <value name="LOSTKIND"/>
        <value name="FOUNDKIND"/>
        <value name="UNKNOWNKIND"/>
      </enumeration>
      <enumeration name="org.modelio.metamodel.uml.behavior.interactionModel.MessageSort">
        <value name="SYNCCALL"/>
        <value name="ASYNCCALL"/>
        <value name="ASYNCSIGNAL"/>
        <value name="DESTROYMESSAGE"/>
        <value name="CREATEMESSAGE"/>
        <value name="RETURNMESSAGE"/>
      </enumeration>
      <enumeration name="org.modelio.metamodel.uml.behavior.stateMachineModel.KindOfStateMachine">
        <value name="DYNAMIC"/>
        <value name="PROTOCOL"/>
      </enumeration>
      <enumeration name="org.modelio.metamodel.uml.statik.AggregationKind">
        <value name="KINDISASSOCIATION"/>
        <value name="KINDISAGGREGATION"/>
        <value name="KINDISCOMPOSITION"/>
      </enumeration>
      <enumeration name="org.modelio.metamodel.uml.statik.KindOfAccess">
        <value name="READ"/>
        <value name="WRITE"/>
        <value name="READWRITE"/>
        <value name="ACCESNONE"/>
      </enumeration>
      <enumeration name="org.modelio.metamodel.uml.statik.MethodPassingMode">
        <value name="METHODIN"/>
        <value name="METHODOUT"/>
      </enumeration>
      <enumeration name="org.modelio.metamodel.uml.statik.PassingMode">
        <value name="IN"/>
        <value name="OUT"/>
        <value name="INOUT"/>
      </enumeration>
      <enumeration name="org.modelio.metamodel.uml.statik.PortOrientation">
        <value name="NONE"/>
        <value name="IN"/>
        <value name="OUT"/>
        <value name="INOUT"/>
      </enumeration>
      <enumeration name="org.modelio.metamodel.uml.statik.VisibilityMode">
        <value name="PUBLIC"/>
        <value name="PROTECTED"/>
        <value name="PRIVATE"/>
        <value name="VISIBILITYUNDEFINED"/>
        <value name="PACKAGEVISIBILITY"/>
      </enumeration>
    </enumerations>
  </fragment>
  <fragment name="modelio.kernel" version="1.0.00" provider="Modeliosoft" providerVersion="1.0.00">
    <metaclasses>
      <metaclass name="SmObject" version="0.0.00" abstract="true">
        <attribute name="status" type="java.lang.Long"></attribute>
      </metaclass>
    </metaclasses>
    <enumerations></enumerations>
  </fragment>
</metamodel>               �� �lftable_String! f#idx.class.Infrastructure.DiagramSet!fusersV16!fmain!fmetamodel_descriptor.xml!f(idx.class.Infrastructure.ModuleComponent!fFORMAT_VERSION!�fGARBAGE_TABLES!�� �l	ftable_String! f#idx.class.Infrastructure.DiagramSet!fusersV16!fmain!fmetamodel_descriptor.xml!f(idx.class.Infrastructure.ModuleComponent!f(idx.class.Infrastructure.AbstractDiagram!fFORMAT_VERSION!�fGARBAGE_TABLES!��l
ftable_String! f%idx.class.Infrastructure.GraphDiagram!f#idx.class.Infrastructure.DiagramSet!fusersV16!fmain!fmetamodel_descriptor.xml!f(idx.class.Infrastructure.ModuleComponent!f(idx.class.Infrastructure.AbstractDiagram!fFORMAT_VERSION!�fGARBAGE_TABLES!��Clftable_String! f%idx.class.Infrastructure.GraphDiagram!f#idx.class.Infrastructure.DiagramSet!f&idx.class.Infrastructure.ImpactDiagram!	fusersV16!fmain!fmetamodel_descriptor.xml!f(idx.class.Infrastructure.ModuleComponent!f(idx.class.Infrastructure.AbstractDiagram!fFORMAT_VERSION!�fGARBAGE_TABLES!��jlftable_String! f%idx.class.Infrastructure.GraphDiagram!f#idx.class.Infrastructure.DiagramSet!f&idx.class.Infrastructure.ImpactDiagram!	fusersV16!fmain!fmetamodel_descriptor.xml!f(idx.class.Infrastructure.ModuleComponent!f(idx.class.Infrastructure.AbstractDiagram!fFORMAT_VERSION!�fGARBAGE_TABLES!f"idx.class.Standard.BehaviorDiagram!
   �   ���lftable_String! f%idx.class.Infrastructure.GraphDiagram!f&idx.class.Infrastructure.ImpactDiagram!	fmain!f idx.class.Standard.StaticDiagram!fmetamodel_descriptor.xml!f#idx.class.Infrastructure.DiagramSet!fusersV16!f(idx.class.Infrastructure.ModuleComponent!f(idx.class.Infrastructure.AbstractDiagram!fFORMAT_VERSION!�fGARBAGE_TABLES!f"idx.class.Standard.BehaviorDiagram!
   �   ���lftable_String! f%idx.class.Infrastructure.GraphDiagram!f&idx.class.Infrastructure.ImpactDiagram!	fmain!f!idx.class.Archimate.ArchimateView!f idx.class.Standard.StaticDiagram!fmetamodel_descriptor.xml!f#idx.class.Infrastructure.DiagramSet!fusersV16!f(idx.class.Infrastructure.ModuleComponent!f(idx.class.Infrastructure.AbstractDiagram!fFORMAT_VERSION!�fGARBAGE_TABLES!f"idx.class.Standard.BehaviorDiagram!
   �   ���lftable_String! f%idx.class.Infrastructure.GraphDiagram!f&idx.class.Infrastructure.ImpactDiagram!	fmain!f!idx.class.Archimate.ArchimateView!f idx.class.Standard.StaticDiagram!fmetamodel_descriptor.xml!f$idx.class.Archimate.ViewPointDiagram!f#idx.class.Infrastructure.DiagramSet!fusersV16!f(idx.class.Infrastructure.ModuleComponent!f(idx.class.Infrastructure.AbstractDiagram!fFORMAT_VERSION!�fGARBAGE_TABLES!f"idx.class.Standard.BehaviorDiagram!
   �   ��lftable_String! f%idx.class.Infrastructure.GraphDiagram!f&idx.class.Infrastructure.ImpactDiagram!	fmain!f!idx.class.Archimate.ArchimateView!f idx.class.Standard.StaticDiagram!fmetamodel_descriptor.xml!f$idx.class.Archimate.ViewPointDiagram!f#idx.class.Infrastructure.DiagramSet!fusersV16!f2idx.class.Standard.BpmnProcessCollaborationDiagram!f(idx.class.Infrastructure.ModuleComponent!f(idx.class.Infrastructure.AbstractDiagram!fFORMAT_VERSION!�fGARBAGE_TABLES!f"idx.class.Standard.BehaviorDiagram!
   �   ��Blftable_String! f%idx.class.Infrastructure.GraphDiagram!f&idx.class.Infrastructure.ImpactDiagram!	fmain!f!idx.class.Archimate.ArchimateView!f idx.class.Standard.StaticDiagram!fmetamodel_descriptor.xml!f$idx.class.Archimate.ViewPointDiagram!f#idx.class.Infrastructure.DiagramSet!fusersV16!f(idx.class.Standard.BpmnSubProcessDiagram!f2idx.class.Standard.BpmnProcessCollaborationDiagram!f(idx.class.Infrastructure.ModuleComponent!f(idx.class.Infrastructure.AbstractDiagram!fFORMAT_VERSION!�fGARBAGE_TABLES!f"idx.class.Standard.BehaviorDiagram!
   �   ��ilftable_String! f%idx.class.Infrastructure.GraphDiagram!f&idx.class.Infrastructure.ImpactDiagram!	fmain!f!idx.class.Archimate.ArchimateView!f idx.class.Standard.StaticDiagram!fmetamodel_descriptor.xml!f$idx.class.Archimate.ViewPointDiagram!f#idx.class.Infrastructure.DiagramSet!fusersV16!f(idx.class.Standard.BpmnSubProcessDiagram!f"idx.class.Standard.ActivityDiagram!f2idx.class.Standard.BpmnProcessCollaborationDiagram!f(idx.class.Infrastructure.ModuleComponent!f(idx.class.Infrastructure.AbstractDiagram!fFORMAT_VERSION!�fGARBAGE_TABLES!f"idx.class.Standard.BehaviorDiagram!
   �   ���lftable_String! f'idx.class.Standard.CommunicationDiagram!f%idx.class.Infrastructure.GraphDiagram!f&idx.class.Infrastructure.ImpactDiagram!	fmain!f!idx.class.Archimate.ArchimateView!f idx.class.Standard.StaticDiagram!fmetamodel_descriptor.xml!f$idx.class.Archimate.ViewPointDiagram!f#idx.class.Infrastructure.DiagramSet!fusersV16!f(idx.class.Standard.BpmnSubProcessDiagram!f"idx.class.Standard.ActivityDiagram!f2idx.class.Standard.BpmnProcessCollaborationDiagram!f(idx.class.Infrastructure.ModuleComponent!f(idx.class.Infrastructure.AbstractDiagram!fFORMAT_VERSION!�fGARBAGE_TABLES!f"idx.class.Standard.BehaviorDiagram!
   �   ���lftable_String! f'idx.class.Standard.CommunicationDiagram!f%idx.class.Infrastructure.GraphDiagram!f&idx.class.In� C0  R       D       BYfrastructure.ImpactDiagram!	fmain!f!idx.class.Archimate.ArchimateView!f idx.class.Standard.StaticDiagram!fmetamodel_descriptor.xml!f$idx.class.Archimate.ViewPointDiagram!f#idx.class.Infrastructure.DiagramSet!fusersV16!f(idx.class.Standard.BpmnSubProcessDiagram!f"idx.class.Standard.SequenceDiagram!f"idx.class.Standard.ActivityDiagram!f2idx.class.Standard.BpmnProcessCollaborationDiagram!f(idx.class.Infrastructure.ModuleComponent!f(idx.class.Infrastructure.AbstractDiagram!fFORMAT_VERSION!�fGARBAGE_TABLES!f"idx.class.Standard.BehaviorDiagram!
   �   ���lftable_String! f'idx.class.Standard.CommunicationDiagram!f%idx.class.Infrastructure.GraphDiagram!f&idx.class.Infrastructure.ImpactDiagram!	fmain!f!idx.class.Archimate.ArchimateView!f idx.class.Standard.StaticDiagram!fmetamodel_descriptor.xml!f$idx.class.Archimate.ViewPointDiagram!f#idx.class.Infrastructure.DiagramSet!fusersV16!f(idx.class.Standard.BpmnSubProcessDiagram!f"idx.class.Standard.SequenceDiagram!f&idx.class.Standard.StateMachineDiagram!f"idx.class.Standard.ActivityDiagram!f2idx.class.Standard.BpmnProcessCollaborationDiagram!f(idx.class.Infrastructure.ModuleComponent!f(idx.class.Infrastructure.AbstractDiagram!fFORMAT_VERSION!�fGARBAGE_TABLES!f"idx.class.Standard.BehaviorDiagram!
   �   ��lftable_String! f'idx.class.Standard.CommunicationDiagram!f%idx.class.Infrastructure.GraphDiagram!f&idx.class.Infrastructure.ImpactDiagram!	fmain!f!idx.class.Archimate.ArchimateView!f+idx.class.Standard.BpmnProcessDesignDiagram!f idx.class.Standard.StaticDiagram!fmetamodel_descriptor.xml!f$idx.class.Archimate.ViewPointDiagram!f#idx.class.Infrastructure.DiagramSet!fusersV16!f(idx.class.Standard.BpmnSubProcessDiagram!f"idx.class.Standard.SequenceDiagram!f&idx.class.Standard.StateMachineDiagram!f"idx.class.Standard.ActivityDiagram!f2idx.class.Standard.BpmnProcessCollaborationDiagram!f(idx.class.Infrastructure.ModuleComponent!f(idx.class.Infrastructure.AbstractDiagram!fFORMAT_VERSION!�fGARBAGE_TABLES!f"idx.class.Standard.BehaviorDiagram!
   �   ��Glftable_String! f'idx.class.Standard.CommunicationDiagram!f%idx.class.Infrastructure.GraphDiagram!f&idx.class.Infrastructure.ImpactDiagram!	fmain!f!idx.class.Archimate.ArchimateView!f+idx.class.Standard.BpmnProcessDesignDiagram!f idx.class.Standard.StaticDiagram!fmetamodel_descriptor.xml!f$idx.class.Archimate.ViewPointDiagram!f#idx.class.Infrastructure.DiagramSet!fusersV16!f(idx.class.Standard.BpmnSubProcessDiagram!f"idx.class.Standard.SequenceDiagram!f&idx.class.Standard.StateMachineDiagram!f+idx.class.Standard.BpmnCollaborationDiagram!f"idx.class.Standard.ActivityDiagram!f2idx.class.Standard.BpmnProcessCollaborationDiagram!f(idx.class.Infrastructure.ModuleComponent!f(idx.class.Infrastructure.AbstractDiagram!fFORMAT_VERSION!�fGARBAGE_TABLES!f"idx.class.Standard.BehaviorDiagram!
   �   ��klftable_String! fidx.class.Standard.ClassDiagram!f'idx.class.Standard.CommunicationDiagram!f%idx.class.Infrastructure.GraphDiagram!f&idx.class.Infrastructure.ImpactDiagram!	fmain!f!idx.class.Archimate.ArchimateView!f+idx.class.Standard.BpmnProcessDesignDiagram!f idx.class.Standard.StaticDiagram!fmetamodel_descriptor.xml!f$idx.class.Archimate.ViewPointDiagram!f#idx.class.Infrastructure.DiagramSet!fusersV16!f(idx.class.Standard.BpmnSubProcessDiagram!f"idx.class.Standard.SequenceDiagram!f&idx.class.Standard.StateMachineDiagram!f+idx.class.Standard.BpmnCollaborationDiagram!f"idx.class.Standard.ActivityDiagram!f2idx.class.Standard.BpmnProcessCollaborationDiagram!f(idx.class.Infrastructure.ModuleComponent!f(idx.class.Infrastructure.AbstractDiagram!fFORMAT_VERSION!�fGARBAGE_TABLES!f"idx.class.Standard.BehaviorDiagram!
   �   ���lf'idx.class.Standard.CommunicationDiagram!f%idx.class.Infrastructure.GraphDiagram!f&idx.class.Infrastructure.ImpactDiagram!	fmain!f+idx.class.Standard.BpmnProcessDesignDiagram!fmetamodel_descriptor.xml!f,idx.class.Standard.CompositeStructureDiagram!fusersV16!f(idx.class.Standard.BpmnSubProcessDiagram!f"idx.class.Standard.SequenceDiagram!f&idx.class.Standard.StateMachineDiagram!f(idx.class.Infrastructure.AbstractDiagram!fFORMAT_VERSION!�ftable_String! fidx.class.Standard.ClassDiagram!f!idx.class.Archimate.ArchimateView!f idx.class.Standard.StaticDiagram!f$idx.class.Archimate.ViewPointDiagram!f#idx.class.Infrastructure.DiagramSet!f+idx.class.Standard.BpmnCollaborationDiagram!f"idx.class.Standard.ActivityDiagram!f2idx.class.Standard.BpmnProcessCollaborationDiagram!f(idx.class.Infrastructure.ModuleComponent!fGARBAGE_TABLES!f"idx.class.Standard.BehaviorDiagram!
   �   ���lf'idx.class.Standard.CommunicationDiagram!f%idx.class.Infrastructure.GraphDiagram!f&idx.class.Infrastructure.ImpactDiagram!	fmain!f+idx.class.Standard.BpmnProcessDesignDiagram!fmetamodel_descriptor.xml!f,idx.class.Standard.CompositeStructureDiagram!fusersV16!f(idx.class.Standard.BpmnSubProcessDiagram!f"idx.class.Standard.SequenceDiagram!f&idx.class.Standard.StateMachineDiagram!f(idx.class.Infrastructure.AbstractDiagram!fFORMAT_VERSION!�ftable_String! fidx.class.Standard.ClassDiagram!f!idx.class.Archimate.ArchimateView!f idx.class.Standard.StaticDiagram!f$idx.class.Archimate.ViewPointDiagram!f$idx.class.Standard.DeploymentDiagram!f#idx.class.Infrastructure.DiagramSet!f+idx.class.Standard.BpmnCollaborationDiagram!f"idx.class.Standard.ActivityDiagram!f2idx.class.Standard.BpmnProcessCollaborationDiagram!f(idx.class.Infrastructure.ModuleComponent!fGARBAGE_TABLES!f"idx.class.Standard.BehaviorDiagram!
   �   ���lf'idx.class.Standard.CommunicationDiagram!f%idx.class.Infrastructure.GraphDiagram!f&idx.class.Infrastructure.ImpactDiagram!	fmain!f+idx.class.Standard.BpmnProcessDesignDiagram!fmetamodel_descriptor.xml!f,idx.class.Standard.CompositeStructureDiagram!f idx.class.Standard.ObjectDiagram!fusersV16!f(idx.class.Standard.BpmnSubProcessDiagram!f"idx.class.Standard.SequenceDiagram!f&idx.class.Standard.StateMachineDiagram!f(idx.class.Infrastructure.AbstractDiagram!fFORMAT_VERSION!�ftable_String! fidx.class.Standard.ClassDiagram!f!idx.class.Archimate.ArchimateView!f idx.class.Standard.StaticDiagram!f$idx.class.Archimate.ViewPointDiagram!f$idx.class.Standard.DeploymentDiagram!f#idx.class.Infrastructure.DiagramSet!f+idx.class.Standard.BpmnCollaborationDiagram!f"idx.class.Standard.ActivityDiagram!f2idx.class.Standard.BpmnProcessCollaborationDiagram!f(idx.class.Infrastructure.ModuleComponent!fGARBAGE_TABLES!f"idx.class.Standard.BehaviorDiagram!
   �   ��lf'idx.class.Standard.CommunicationDiagram!f%idx.class.Infrastructure.GraphDiagram!f&idx.class.Infrastructure.ImpactDiagram!	f!idx.class.Standard.UseCaseDiagram!fmain!f+idx.class.Standard.BpmnProcessDesignDiagram!fmetamodel_descriptor.xml!f,idx.class.Standard.CompositeStructureDiagram!f idx.class.Standard.ObjectDiagram!fusersV16!f(idx.class.Standard.BpmnSubProcessDiagram!f"idx.class.Standard.SequenceDiagram!f&idx.class.Standard.StateMachineDiagram!f(idx.class.Infrastructure.AbstractDiagram!fFORMAT_VERSION!�ftable_String! fidx.class.Standard.ClassDiagram!f!idx.class.Archimate.ArchimateView!f idx.class.Standard.StaticDiagram!f$idx.class.Archimate.ViewPointDiagram!f$idx.class.Standard.DeploymentDiagram!f#idx.class.Infrastructure.DiagramSet!f+idx.class.Standard.BpmnCollaborationDiagram!f"idx.class.Standard.ActivityDiagram!f2idx.class.Standard.BpmnProcessCollaborationDiagram!f(idx.class.Infrastructure.ModuleComponent!fGARBAGE_TABLES!f"idx.class.Standard.BehaviorDiagram!
   �   ��6lf'idx.class.Standard.CommunicationDiagram!f%idx.class.Infrastructure.GraphDiagram!f&idx.class.Infrastructure.ImpactDiagram!	f!idx.class.Standard.UseCaseDiagram!f!idx.class.Infrastructure.NoteType!fmain!f+idx.class.Standard.BpmnProcessDesignDiagram!fmetamodel_descriptor.xml!f,� D0  R       E       C#idx.class.Standard.CompositeStructureDiagram!f idx.class.Standard.ObjectDiagram!fusersV16!f(idx.class.Standard.BpmnSubProcessDiagram!f"idx.class.Standard.SequenceDiagram!f&idx.class.Standard.StateMachineDiagram!f(idx.class.Infrastructure.AbstractDiagram!fFORMAT_VERSION!�ftable_String! fidx.class.Standard.ClassDiagram!f!idx.class.Archimate.ArchimateView!f idx.class.Standard.StaticDiagram!f$idx.class.Archimate.ViewPointDiagram!f$idx.class.Standard.DeploymentDiagram!f#idx.class.Infrastructure.DiagramSet!f+idx.class.Standard.BpmnCollaborationDiagram!f"idx.class.Standard.ActivityDiagram!f2idx.class.Standard.BpmnProcessCollaborationDiagram!f(idx.class.Infrastructure.ModuleComponent!fGARBAGE_TABLES!f"idx.class.Standard.BehaviorDiagram!
   �   ��Zlf'idx.class.Standard.CommunicationDiagram!f%idx.class.Infrastructure.GraphDiagram!f&idx.class.Infrastructure.ImpactDiagram!	f!idx.class.Standard.UseCaseDiagram!f!idx.class.Infrastructure.NoteType!fmain!f+idx.class.Standard.BpmnProcessDesignDiagram!fmetamodel_descriptor.xml!f,idx.class.Standard.CompositeStructureDiagram!f idx.class.Standard.ObjectDiagram!fusersV16!f(idx.class.Standard.BpmnSubProcessDiagram!f"idx.class.Standard.SequenceDiagram!f&idx.class.Standard.StateMachineDiagram!f(idx.class.Infrastructure.AbstractDiagram!fFORMAT_VERSION!�ftable_String! fidx.class.Standard.ClassDiagram!f!idx.class.Archimate.ArchimateView!f idx.class.Standard.StaticDiagram!f$idx.class.Archimate.ViewPointDiagram!fidx.class.Standard.GeneralClass!f$idx.class.Standard.DeploymentDiagram!f#idx.class.Infrastructure.DiagramSet!f+idx.class.Standard.BpmnCollaborationDiagram!f"idx.class.Standard.ActivityDiagram!f2idx.class.Standard.BpmnProcessCollaborationDiagram!f(idx.class.Infrastructure.ModuleComponent!fGARBAGE_TABLES!f"idx.class.Standard.BehaviorDiagram!
   �   ��xlf'idx.class.Standard.CommunicationDiagram!f%idx.class.Infrastructure.GraphDiagram!f&idx.class.Infrastructure.ImpactDiagram!	f!idx.class.Standard.UseCaseDiagram!f!idx.class.Infrastructure.NoteType!fmain!f+idx.class.Standard.BpmnProcessDesignDiagram!fmetamodel_descriptor.xml!f,idx.class.Standard.CompositeStructureDiagram!f idx.class.Standard.ObjectDiagram!fusersV16!f(idx.class.Standard.BpmnSubProcessDiagram!f"idx.class.Standard.SequenceDiagram!f&idx.class.Standard.StateMachineDiagram!f(idx.class.Infrastructure.AbstractDiagram!fFORMAT_VERSION!�ftable_String! fidx.class.Standard.ClassDiagram!f!idx.class.Archimate.ArchimateView!f idx.class.Standard.StaticDiagram!f$idx.class.Archimate.ViewPointDiagram!fidx.class.Standard.GeneralClass!f$idx.class.Standard.DeploymentDiagram!f#idx.class.Infrastructure.DiagramSet!fidx.class.Standard.Signal!f+idx.class.Standard.BpmnCollaborationDiagram!f"idx.class.Standard.ActivityDiagram!f2idx.class.Standard.BpmnProcessCollaborationDiagram!f(idx.class.Infrastructure.ModuleComponent!fGARBAGE_TABLES!f"idx.class.Standard.BehaviorDiagram!
   �   ���l f'idx.class.Standard.CommunicationDiagram!f%idx.class.Infrastructure.GraphDiagram!f&idx.class.Infrastructure.ImpactDiagram!	f!idx.class.Standard.UseCaseDiagram!f!idx.class.Infrastructure.NoteType!fmain!f+idx.class.Standard.BpmnProcessDesignDiagram!fmetamodel_descriptor.xml!f,idx.class.Standard.CompositeStructureDiagram!f idx.class.Standard.ObjectDiagram!fusersV16!f(idx.class.Standard.BpmnSubProcessDiagram!f"idx.class.Standard.SequenceDiagram!f&idx.class.Standard.StateMachineDiagram!f(idx.class.Infrastructure.AbstractDiagram!fFORMAT_VERSION!�ftable_String! fidx.class.Standard.ClassDiagram!f!idx.class.Archimate.ArchimateView!f idx.class.Standard.StaticDiagram!fidx.class.Standard.Actor!f$idx.class.Archimate.ViewPointDiagram!fidx.class.Standard.GeneralClass!f$idx.class.Standard.DeploymentDiagram!f#idx.class.Infrastructure.DiagramSet!fidx.class.Standard.Signal!f+idx.class.Standard.BpmnCollaborationDiagram!f"idx.class.Standard.ActivityDiagram!f2idx.class.Standard.BpmnProcessCollaborationDiagram!f(idx.class.Infrastructure.ModuleComponent!fGARBAGE_TABLES!f"idx.class.Standard.BehaviorDiagram!
   �   ���l!fidx.class.Standard.UseCase!f'idx.class.Standard.CommunicationDiagram!f%idx.class.Infrastructure.GraphDiagram!f&idx.class.Infrastructure.ImpactDiagram!	f!idx.class.Standard.UseCaseDiagram!f!idx.class.Infrastructure.NoteType!fmain!f+idx.class.Standard.BpmnProcessDesignDiagram!fmetamodel_descriptor.xml!f,idx.class.Standard.CompositeStructureDiagram!f idx.class.Standard.ObjectDiagram!fusersV16!f(idx.class.Standard.BpmnSubProcessDiagram!f"idx.class.Standard.SequenceDiagram!f&idx.class.Standard.StateMachineDiagram!f(idx.class.Infrastructure.AbstractDiagram!fFORMAT_VERSION!�ftable_String! fidx.class.Standard.ClassDiagram!f!idx.class.Archimate.ArchimateView!f idx.class.Standard.StaticDiagram!fidx.class.Standard.Actor!f$idx.class.Archimate.ViewPointDiagram!fidx.class.Standard.GeneralClass!f$idx.class.Standard.DeploymentDiagram!f#idx.class.Infrastructure.DiagramSet!fidx.class.Standard.Signal!f+idx.class.Standard.BpmnCollaborationDiagram!f"idx.class.Standard.ActivityDiagram!f2idx.class.Standard.BpmnProcessCollaborationDiagram!f(idx.class.Infrastructure.ModuleComponent!fGARBAGE_TABLES!f"idx.class.Standard.BehaviorDiagram!
   �   ���l"fidx.class.Standard.UseCase!f'idx.class.Standard.CommunicationDiagram!f%idx.class.Infrastructure.GraphDiagram!f&idx.class.Infrastructure.ImpactDiagram!	f!idx.class.Standard.UseCaseDiagram!f!idx.class.Infrastructure.NoteType!fmain!f+idx.class.Standard.BpmnProcessDesignDiagram!fmetamodel_descriptor.xml!fidx.class.Standard.Class! f,idx.class.Standard.CompositeStructureDiagram!f idx.class.Standard.ObjectDiagram!fusersV16!f(idx.class.Standard.BpmnSubProcessDiagram!f"idx.class.Standard.SequenceDiagram!f&idx.class.Standard.StateMachineDiagram!f(idx.class.Infrastructure.AbstractDiagram!fFORMAT_VERSION!�ftable_String! fidx.class.Standard.ClassDiagram!f!idx.class.Archimate.ArchimateView!f idx.class.Standard.StaticDiagram!fidx.class.Standard.Actor!f$idx.class.Archimate.ViewPointDiagram!fidx.class.Standard.GeneralClass!f$idx.class.Standard.DeploymentDiagram!f#idx.class.Infrastructure.DiagramSet!fidx.class.Standard.Signal!f+idx.class.Standard.BpmnCollaborationDiagram!f"idx.class.Standard.ActivityDiagram!f2idx.class.Standard.BpmnProcessCollaborationDiagram!f(idx.class.Infrastructure.ModuleComponent!fGARBAGE_TABLES!f"idx.class.Standard.BehaviorDiagram!
   �   ���l#fidx.class.Standard.UseCase!f'idx.class.Standard.CommunicationDiagram!f%idx.class.Infrastructure.GraphDiagram!f&idx.class.Infrastructure.ImpactDiagram!	f!idx.class.Standard.UseCaseDiagram!f!idx.class.Infrastructure.NoteType!fmain!f+idx.class.Standard.BpmnProcessDesignDiagram!fmetamodel_descriptor.xml!fidx.class.Standard.Class! f,idx.class.Standard.CompositeStructureDiagram!fidx.class.Standard.DataType!!f idx.class.Standard.ObjectDiagram!fusersV16!f(idx.class.Standard.BpmnSubProcessDiagram!f"idx.class.Standard.SequenceDiagram!f&idx.class.Standard.StateMachineDiagram!f(idx.class.Infrastructure.AbstractDiagram!fFORMAT_VERSION!�ftable_String! fidx.class.Standard.ClassDiagram!f!idx.class.Archimate.ArchimateView!f idx.class.Standard.StaticDiagram!fidx.class.Standard.Actor!f$idx.class.Archimate.ViewPointDiagram!fidx.class.Standard.GeneralClass!f$idx.class.Standard.DeploymentDiagram!f#idx.class.Infrastructure.DiagramSet!fidx.class.Standard.Signal!f+idx.class.Standard.BpmnCollaborationDiagram!f"idx.class.Standard.ActivityDiagram!f2idx.class.Standard.BpmnProcessCollaborationDiagram!f(idx.class.Infrastructure.ModuleComponent!fGARBAGE_TABLES!f"idx.class.Standard.BehaviorDiagram!
   �   ��l$fidx.class.Standard.UseCase!f'idx.class.Standard.CommunicationDiagram!fidx.class.Standard.Enumeration!"f%idx.class.Infrastructure.GraphDiagram!f&idx.class� E0  R       F       D�.Infrastructure.ImpactDiagram!	f!idx.class.Standard.UseCaseDiagram!f!idx.class.Infrastructure.NoteType!fmain!f+idx.class.Standard.BpmnProcessDesignDiagram!fmetamodel_descriptor.xml!fidx.class.Standard.Class! f,idx.class.Standard.CompositeStructureDiagram!fidx.class.Standard.DataType!!f idx.class.Standard.ObjectDiagram!fusersV16!f(idx.class.Standard.BpmnSubProcessDiagram!f"idx.class.Standard.SequenceDiagram!f&idx.class.Standard.StateMachineDiagram!f(idx.class.Infrastructure.AbstractDiagram!fFORMAT_VERSION!�ftable_String! fidx.class.Standard.ClassDiagram!f!idx.class.Archimate.ArchimateView!f idx.class.Standard.StaticDiagram!fidx.class.Standard.Actor!f$idx.class.Archimate.ViewPointDiagram!fidx.class.Standard.GeneralClass!f$idx.class.Standard.DeploymentDiagram!f#idx.class.Infrastructure.DiagramSet!fidx.class.Standard.Signal!f+idx.class.Standard.BpmnCollaborationDiagram!f"idx.class.Standard.ActivityDiagram!f2idx.class.Standard.BpmnProcessCollaborationDiagram!f(idx.class.Infrastructure.ModuleComponent!fGARBAGE_TABLES!f"idx.class.Standard.BehaviorDiagram!
   �   ��5l%fidx.class.Standard.UseCase!f'idx.class.Standard.CommunicationDiagram!fidx.class.Standard.Enumeration!"f%idx.class.Infrastructure.GraphDiagram!f&idx.class.Infrastructure.ImpactDiagram!	f!idx.class.Standard.UseCaseDiagram!f!idx.class.Infrastructure.NoteType!fmain!f+idx.class.Standard.BpmnProcessDesignDiagram!fmetamodel_descriptor.xml!fidx.class.Standard.Class! f,idx.class.Standard.CompositeStructureDiagram!fidx.class.Standard.DataType!!f idx.class.Standard.ObjectDiagram!fusersV16!f(idx.class.Standard.BpmnSubProcessDiagram!f"idx.class.Standard.SequenceDiagram!f&idx.class.Standard.StateMachineDiagram!fidx.class.Standard.Interface!#f(idx.class.Infrastructure.AbstractDiagram!fFORMAT_VERSION!�ftable_String! fidx.class.Standard.ClassDiagram!f!idx.class.Archimate.ArchimateView!f idx.class.Standard.StaticDiagram!fidx.class.Standard.Actor!f$idx.class.Archimate.ViewPointDiagram!fidx.class.Standard.GeneralClass!f$idx.class.Standard.DeploymentDiagram!f#idx.class.Infrastructure.DiagramSet!fidx.class.Standard.Signal!f+idx.class.Standard.BpmnCollaborationDiagram!f"idx.class.Standard.ActivityDiagram!f2idx.class.Standard.BpmnProcessCollaborationDiagram!f(idx.class.Infrastructure.ModuleComponent!fGARBAGE_TABLES!f"idx.class.Standard.BehaviorDiagram!
   �   ��^l&fidx.class.Standard.UseCase!f'idx.class.Standard.CommunicationDiagram!fidx.class.Standard.Enumeration!"f%idx.class.Infrastructure.GraphDiagram!f&idx.class.Infrastructure.ImpactDiagram!	f!idx.class.Standard.UseCaseDiagram!f!idx.class.Infrastructure.NoteType!fmain!f+idx.class.Standard.BpmnProcessDesignDiagram!fmetamodel_descriptor.xml!fidx.class.Standard.Class! f,idx.class.Standard.CompositeStructureDiagram!fidx.class.Standard.DataType!!f idx.class.Standard.ObjectDiagram!fusersV16!f(idx.class.Standard.BpmnSubProcessDiagram!f"idx.class.Standard.SequenceDiagram!f&idx.class.Standard.StateMachineDiagram!fidx.class.Standard.Interface!#f(idx.class.Infrastructure.AbstractDiagram!fFORMAT_VERSION!�ftable_String! fidx.class.Standard.ClassDiagram!f$idx.class.Standard.TemplateParameter!$f!idx.class.Archimate.ArchimateView!f idx.class.Standard.StaticDiagram!fidx.class.Standard.Actor!f$idx.class.Archimate.ViewPointDiagram!fidx.class.Standard.GeneralClass!f$idx.class.Standard.DeploymentDiagram!f#idx.class.Infrastructure.DiagramSet!fidx.class.Standard.Signal!f+idx.class.Standard.BpmnCollaborationDiagram!f"idx.class.Standard.ActivityDiagram!f2idx.class.Standard.BpmnProcessCollaborationDiagram!f(idx.class.Infrastructure.ModuleComponent!fGARBAGE_TABLES!f"idx.class.Standard.BehaviorDiagram!
   �   ��l'fidx.class.Standard.UseCase!f'idx.class.Standard.CommunicationDiagram!fidx.class.Standard.Enumeration!"f%idx.class.Infrastructure.GraphDiagram!f&idx.class.Infrastructure.ImpactDiagram!	f!idx.class.Standard.UseCaseDiagram!f!idx.class.Infrastructure.NoteType!fmain!f+idx.class.Standard.BpmnProcessDesignDiagram!fmetamodel_descriptor.xml!fidx.class.Standard.Class! f,idx.class.Standard.CompositeStructureDiagram!fidx.class.Standard.DataType!!f idx.class.Standard.ObjectDiagram!fusersV16!f(idx.class.Standard.BpmnSubProcessDiagram!f"idx.class.Standard.SequenceDiagram!f&idx.class.Standard.StateMachineDiagram!fidx.class.Standard.Interface!#f(idx.class.Infrastructure.AbstractDiagram!fFORMAT_VERSION!�ftable_String! fidx.class.Standard.ClassDiagram!f$idx.class.Standard.TemplateParameter!$f!idx.class.Archimate.ArchimateView!f idx.class.Standard.StaticDiagram!fidx.class.Standard.Actor!f$idx.class.Archimate.ViewPointDiagram!fidx.class.Standard.GeneralClass!f$idx.class.Standard.DeploymentDiagram!f#idx.class.Infrastructure.DiagramSet!fidx.class.Standard.Signal!f+idx.class.Standard.BpmnCollaborationDiagram!f"idx.class.Standard.ActivityDiagram!f2idx.class.Standard.BpmnProcessCollaborationDiagram!f(idx.class.Infrastructure.ModuleComponent!fGARBAGE_TABLES!f"idx.class.Standard.BehaviorDiagram!
fidx.class.Standard.Component!%   �   ���l(fidx.class.Standard.UseCase!f'idx.class.Standard.CommunicationDiagram!fidx.class.Standard.Enumeration!"f%idx.class.Infrastructure.GraphDiagram!f&idx.class.Infrastructure.ImpactDiagram!	f!idx.class.Standard.UseCaseDiagram!f!idx.class.Infrastructure.NoteType!fmain!f+idx.class.Standard.BpmnProcessDesignDiagram!fmetamodel_descriptor.xml!fidx.class.Standard.Class! f,idx.class.Standard.CompositeStructureDiagram!fidx.class.Standard.DataType!!f idx.class.Standard.ObjectDiagram!fusersV16!f(idx.class.Standard.BpmnSubProcessDiagram!f"idx.class.Standard.SequenceDiagram!f&idx.class.Standard.StateMachineDiagram!fidx.class.Standard.Interface!#f(idx.class.Infrastructure.AbstractDiagram!fFORMAT_VERSION!�ftable_String! fidx.class.Standard.ClassDiagram!f$idx.class.Standard.TemplateParameter!$f!idx.class.Archimate.ArchimateView!f idx.class.Standard.StaticDiagram!fidx.class.Standard.Actor!fidx.class.Standard.NameSpace!&f$idx.class.Archimate.ViewPointDiagram!fidx.class.Standard.GeneralClass!f$idx.class.Standard.DeploymentDiagram!f#idx.class.Infrastructure.DiagramSet!fidx.class.Standard.Signal!f+idx.class.Standard.BpmnCollaborationDiagram!f"idx.class.Standard.ActivityDiagram!f2idx.class.Standard.BpmnProcessCollaborationDiagram!f(idx.class.Infrastructure.ModuleComponent!fGARBAGE_TABLES!f"idx.class.Standard.BehaviorDiagram!
fidx.class.Standard.Component!%   �   ���l)fidx.class.Standard.UseCase!f'idx.class.Standard.CommunicationDiagram!fidx.class.Standard.Enumeration!"f%idx.class.Infrastructure.GraphDiagram!f&idx.class.Infrastructure.ImpactDiagram!	f!idx.class.Standard.UseCaseDiagram!f!idx.class.Infrastructure.NoteType!fmain!f+idx.class.Standard.BpmnProcessDesignDiagram!fmetamodel_descriptor.xml!fidx.class.Standard.Class! f,idx.class.Standard.CompositeStructureDiagram!fidx.class.Standard.DataType!!f idx.class.Standard.ObjectDiagram!fusersV16!f(idx.class.Standard.BpmnSubProcessDiagram!f"idx.class.Standard.SequenceDiagram!f&idx.class.Standard.StateMachineDiagram!fidx.class.Standard.Interface!#f(idx.class.Infrastructure.AbstractDiagram!fFORMAT_VERSION!�ftable_String! fidx.class.Standard.ClassDiagram!f$idx.class.Standard.TemplateParameter!$f!idx.class.Archimate.ArchimateView!f idx.class.Standard.StaticDiagram!fidx.class.Standard.Actor!fidx.class.Standard.NameSpace!&f$idx.class.Archimate.ViewPointDiagram!fidx.class.Standard.GeneralClass!f$idx.class.Standard.DeploymentDiagram!fidx.class.Standard.Classifier!'f#idx.class.Infrastructure.DiagramSet!fidx.class.Standard.Signal!f+idx.class.Standard.BpmnCollaborationDiagram!f"idx.class.Standard.ActivityDiagram!f2idx.class.Standard.BpmnProcessCollaborationDiagram!f(idx.class.Infrastructure.ModuleComponent!fGARBAGE_TABLES!f"idx.class.Stan� F0  R               E Ldard.BehaviorDiagram!
fidx.class.Standard.Component!%   �   ���l*fidx.class.Standard.UseCase!f'idx.class.Standard.CommunicationDiagram!fidx.class.Standard.Enumeration!"f%idx.class.Infrastructure.GraphDiagram!f idx.class.Standard.Collaboration!(f&idx.class.Infrastructure.ImpactDiagram!	f!idx.class.Standard.UseCaseDiagram!f!idx.class.Infrastructure.NoteType!fmain!f+idx.class.Standard.BpmnProcessDesignDiagram!fmetamodel_descriptor.xml!fidx.class.Standard.Class! f,idx.class.Standard.CompositeStructureDiagram!fidx.class.Standard.DataType!!f idx.class.Standard.ObjectDiagram!fusersV16!f(idx.class.Standard.BpmnSubProcessDiagram!f"idx.class.Standard.SequenceDiagram!f&idx.class.Standard.StateMachineDiagram!fidx.class.Standard.Interface!#f(idx.class.Infrastructure.AbstractDiagram!fFORMAT_VERSION!�ftable_String! fidx.class.Standard.ClassDiagram!f$idx.class.Standard.TemplateParameter!$f!idx.class.Archimate.ArchimateView!f idx.class.Standard.StaticDiagram!fidx.class.Standard.Actor!fidx.class.Standard.NameSpace!&f$idx.class.Archimate.ViewPointDiagram!fidx.class.Standard.GeneralClass!f$idx.class.Standard.DeploymentDiagram!fidx.class.Standard.Classifier!'f#idx.class.Infrastructure.DiagramSet!fidx.class.Standard.Signal!f+idx.class.Standard.BpmnCollaborationDiagram!f"idx.class.Standard.ActivityDiagram!f2idx.class.Standard.BpmnProcessCollaborationDiagram!f(idx.class.Infrastructure.ModuleComponent!fGARBAGE_TABLES!f"idx.class.Standard.BehaviorDiagram!
fidx.class.Standard.Component!%   �   ��l+fidx.class.Standard.UseCase!f'idx.class.Standard.CommunicationDiagram!fidx.class.Standard.Enumeration!"f%idx.class.Infrastructure.GraphDiagram!f idx.class.Standard.Collaboration!(f&idx.class.Infrastructure.ImpactDiagram!	f!idx.class.Standard.UseCaseDiagram!f!idx.class.Infrastructure.NoteType!fmain!f+idx.class.Standard.BpmnProcessDesignDiagram!fmetamodel_descriptor.xml!fidx.class.Standard.Class! f,idx.class.Standard.CompositeStructureDiagram!fidx.class.Standard.DataType!!f idx.class.Standard.ObjectDiagram!fusersV16!f(idx.class.Standard.BpmnSubProcessDiagram!f"idx.class.Standard.SequenceDiagram!f&idx.class.Standard.StateMachineDiagram!fidx.class.Standard.Interface!#f(idx.class.Infrastructure.AbstractDiagram!fFORMAT_VERSION!�ftable_String! fidx.class.Standard.ClassDiagram!f$idx.class.Standard.TemplateParameter!$f!idx.class.Archimate.ArchimateView!f idx.class.Standard.StaticDiagram!fidx.class.Standard.Actor!fidx.class.Standard.NameSpace!&f$idx.class.Archimate.ViewPointDiagram!fidx.class.Standard.GeneralClass!fidx.class.Standard.Package!)f$idx.class.Standard.DeploymentDiagram!fidx.class.Standard.Classifier!'f#idx.class.Infrastructure.DiagramSet!fidx.class.Standard.Signal!f+idx.class.Standard.BpmnCollaborationDiagram!f"idx.class.Standard.ActivityDiagram!f2idx.class.Standard.BpmnProcessCollaborationDiagram!f(idx.class.Infrastructure.ModuleComponent!fGARBAGE_TABLES!f"idx.class.Standard.BehaviorDiagram!
fidx.class.Standard.Component!%   �   ��-l,fidx.class.Standard.UseCase!f'idx.class.Standard.CommunicationDiagram!fidx.class.Standard.Enumeration!"f%idx.class.Infrastructure.GraphDiagram!f idx.class.Standard.Collaboration!(f&idx.class.Infrastructure.ImpactDiagram!	f!idx.class.Standard.UseCaseDiagram!f!idx.class.Infrastructure.NoteType!fmain!f+idx.class.Standard.BpmnProcessDesignDiagram!fmetamodel_descriptor.xml!fidx.class.Standard.Class! f,idx.class.Standard.CompositeStructureDiagram!fidx.class.Standard.DataType!!f idx.class.Standard.ObjectDiagram!fusersV16!f(idx.class.Standard.BpmnSubProcessDiagram!f"idx.class.Standard.SequenceDiagram!f&idx.class.Standard.StateMachineDiagram!fidx.class.Standard.Interface!#f(idx.class.Infrastructure.AbstractDiagram!fFORMAT_VERSION!�ftable_String! fidx.class.Standard.ClassDiagram!f$idx.class.Standard.TemplateParameter!$f!idx.class.Archimate.ArchimateView!f idx.class.Standard.StaticDiagram!fidx.class.Standard.Actor!fidx.class.Standard.NameSpace!&f$idx.class.Archimate.ViewPointDiagram!fidx.class.Standard.GeneralClass!fidx.class.Standard.Package!)f$idx.class.Standard.DeploymentDiagram!fidx.class.Standard.Classifier!'f#idx.class.Infrastructure.DiagramSet!fidx.class.Standard.Signal!f+idx.class.Standard.BpmnCollaborationDiagram!f"idx.class.Standard.ActivityDiagram!f"idx.class.Standard.InformationItem!*f2idx.class.Standard.BpmnProcessCollaborationDiagram!f(idx.class.Infrastructure.ModuleComponent!fGARBAGE_TABLES!f"idx.class.Standard.BehaviorDiagram!
fidx.class.Standard.Component!%   �   ��Ml-fidx.class.Standard.UseCase!f'idx.class.Standard.CommunicationDiagram!fidx.class.Standard.Enumeration!"f%idx.class.Infrastructure.GraphDiagram!f idx.class.Standard.Collaboration!(f&idx.class.Infrastructure.ImpactDiagram!	f!idx.class.Standard.UseCaseDiagram!f!idx.class.Infrastructure.NoteType!fmain!f+idx.class.Standard.BpmnProcessDesignDiagram!fmetamodel_descriptor.xml!fidx.class.Standard.Class! f,idx.class.Standard.CompositeStructureDiagram!fidx.class.Standard.DataType!!f idx.class.Standard.ObjectDiagram!fusersV16!f(idx.class.Standard.BpmnSubProcessDiagram!f"idx.class.Standard.SequenceDiagram!f&idx.class.Standard.StateMachineDiagram!fidx.class.Standard.Interface!#f(idx.class.Infrastructure.AbstractDiagram!fFORMAT_VERSION!�ftable_String! fidx.class.Standard.ClassDiagram!fidx.class.Standard.Artifact!+f$idx.class.Standard.TemplateParameter!$f!idx.class.Archimate.ArchimateView!f idx.class.Standard.StaticDiagram!fidx.class.Standard.Actor!fidx.class.Standard.NameSpace!&f$idx.class.Archimate.ViewPointDiagram!fidx.class.Standard.GeneralClass!fidx.class.Standard.Package!)f$idx.class.Standard.DeploymentDiagram!fidx.class.Standard.Classifier!'f#idx.class.Infrastructure.DiagramSet!fidx.class.Standard.Signal!f+idx.class.Standard.BpmnCollaborationDiagram!f"idx.class.Standard.ActivityDiagram!f"idx.class.Standard.InformationItem!*f2idx.class.Standard.BpmnProcessCollaborationDiagram!f(idx.class.Infrastructure.ModuleComponent!fGARBAGE_TABLES!f"idx.class.Standard.BehaviorDiagram!
fidx.class.Standard.Component!%   �     il.fidx.class.Standard.UseCase!f'idx.class.Standard.CommunicationDiagram!fidx.class.Standard.Enumeration!"f%idx.class.Infrastructure.GraphDiagram!f idx.class.Standard.Collaboration!(f&idx.class.Infrastructure.ImpactDiagram!	f!idx.class.Standard.UseCaseDiagram!f!idx.class.Infrastructure.NoteType!fmain!f+idx.class.Standard.BpmnProcessDesignDiagram!fmetamodel_descriptor.xml!fidx.class.Standard.Class! f,idx.class.Standard.CompositeStructureDiagram!fidx.class.Standard.DataType!!f idx.class.Standard.ObjectDiagram!fusersV16!f(idx.class.Standard.BpmnSubProcessDiagram!f"idx.class.Standard.SequenceDiagram!f&idx.class.Standard.StateMachineDiagram!fidx.class.Standard.Node!,fidx.class.Standard.Interface!#f(idx.class.Infrastructure.AbstractDiagram!fFORMAT_VERSION!�ftable_String! fidx.class.Standard.ClassDiagram!fidx.class.Standard.Artifact!+f$idx.class.Standard.TemplateParameter!$f!idx.class.Archimate.ArchimateView!f idx.class.Standard.StaticDiagram!fidx.class.Standard.Actor!fidx.class.Standard.NameSpace!&f$idx.class.Archimate.ViewPointDiagram!fidx.class.Standard.GeneralClass!fidx.class.Standard.Package!)f$idx.class.Standard.DeploymentDiagram!fidx.class.Standard.Classifier!'f#idx.class.Infrastructure.DiagramSet!fidx.class.Standard.Signal!f+idx.class.Standard.BpmnCollaborationDiagram!f"idx.class.Standard.ActivityDiagram!f"idx.class.Standard.InformationItem!*f2idx.class.Standard.BpmnProcessCollaborationDiagram!f(idx.class.Infrastructure.ModuleComponent!fGARBAGE_TABLES!f"idx.class.Standard.BehaviorDiagram!
fidx.class.Standard.Component!%                                                                                                                                                                   � 0  R              �="Standard" name="UmlModelElement"/>
        <dependency name="Origin" min="1" max="1" navigate="false">
          <target fragment="Standard" name="UseCase"/>
          <opposite name="Used"/>
        </dependency>
        <dependency name="ExtensionLocation" min="0" max="-1" navigate="true">
          <target fragment="Standard" name="ExtensionPoint"/>
          <opposite name="Extended"/>
        </dependency>
        <dependency name="Target" min="1" max="1" navigate="true">
          <target fragment="Standard" name="UseCase"/>
          <opposite name="User"/>
        </dependency>
        <sources>
          <dep name="Origin"/>
        </sources>
        <targets>
          <dep name="Target"/>
        </targets>
      </link_metaclass>
      <metaclass name="UseCaseDiagram" version="0.0.9054" cmsNode="true">
        <parent fragment="Standard" name="StaticDiagram"/>
      </metaclass>
      <metaclass name="ValuePin" version="0.0.9054">
        <parent fragment="Standard" name="InputPin"/>
        <attribute name="Value" type="java.lang.String"></attribute>
      </metaclass>
    </metaclasses>
    <enumerations>
      <enumeration name="org.modelio.metamodel.bpmn.activities.AdHocOrdering">
        <value name="PARALLELORDERING"/>
        <value name="SEQUENTIALORDERING"/>
      </enumeration>
      <enumeration name="org.modelio.metamodel.bpmn.activities.MultiInstanceBehavior">
        <value name="NONEBEHAVIOR"/>
        <value name="ONEBEHAVIOR"/>
        <value name="ALLBEHAVIOR"/>
        <value name="COMPLEXBEHAVIOR"/>
      </enumeration>
      <enumeration name="org.modelio.metamodel.bpmn.activities.TransactionMethod">
        <value name="COMPENSATETRANSACTION"/>
        <value name="STORETRANSACTION"/>
        <value name="IMAGETRANSACTION"/>
      </enumeration>
      <enumeration name="org.modelio.metamodel.bpmn.gateways.BpmnEventBasedGatewayType">
        <value name="PARALLELGATEWAY"/>
        <value name="EXCLUSIVEGATEWAY"/>
      </enumeration>
      <enumeration name="org.modelio.metamodel.bpmn.gateways.BpmnGatewayDirection">
        <value name="UNSPECIFIEDDIRECTION"/>
        <value name="CONVERGINGDIRECTION"/>
        <value name="DIVERGINGDIRECTION"/>
        <value name="MIXEDDIRECTION"/>
      </enumeration>
      <enumeration name="org.modelio.metamodel.bpmn.objects.BpmnItemKind">
        <value name="PHYSICAL"/>
        <value name="INFORMATION"/>
      </enumeration>
      <enumeration name="org.modelio.metamodel.bpmn.processCollaboration.BpmnProcessType">
        <value name="NONEPROCESS"/>
        <value name="PUBLICPROCESS"/>
        <value name="PRIVATEPROCESS"/>
      </enumeration>
      <enumeration name="org.modelio.metamodel.bpmn.processCollaboration.OptionalBoolean">
        <value name="OFALSE"/>
        <value name="OTRUE"/>
        <value name="OUNDEFINED"/>
      </enumeration>
      <enumeration name="org.modelio.metamodel.bpmn.rootElements.BpmnAssociationDirection">
        <value name="NONEDIRECTION"/>
        <value name="ONEDIRECTION"/>
        <value name="BOTHDIRECTION"/>
      </enumeration>
      <enumeration name="org.modelio.metamodel.uml.behavior.activityModel.DecisionNodeKind">
        <value name="COMPLEXDECISION"/>
        <value name="EXCLUSIVEDECISION"/>
        <value name="INCLUSIVEDECISION"/>
        <value name="EVENTBASEDDECISION"/>
      </enumeration>
      <enumeration name="org.modelio.metamodel.uml.behavior.activityModel.ExpansionKind">
        <value name="PARALLEL"/>
        <value name="ITERATIVE"/>
        <value name="STREAM"/>
      </enumeration>
      <enumeration name="org.modelio.metamodel.uml.behavior.activityModel.ObjectFlowEffectKind">
        <value name="CREATEFLOW"/>
        <value name="READFLOW"/>
        <value name="UPDATEFLOW"/>
        <value name="DELETEFLOW"/>
        <value name="EXCEPTIONFLOW"/>
      </enumeration>
      <enumeration name="org.modelio.metamodel.uml.behavior.activityModel.ObjectNodeOrderingKind">
        <value name="UNORDERED"/>
        <value name="ORDERED"/>
        <value name="LIFO"/>
        <value name="FIFO"/>
      </enumeration>
      <enumeration name="org.modelio.metamodel.uml.behavior.commonBehaviors.EventType">
        <value name="SIGNALEVENT"/>
        <value name="CALLEVENT"/>
        <value name="TIMEEVENT"/>
        <value name="CHANGEEVENT"/>
      </enumeration>
      <enumeration name="org.modelio.metamodel.uml.behavior.commonBehaviors.ParameterEffectKind">
        <value name="CREATEEFFECT"/>
        <value name="READEFFECT"/>
        <value name="UPDATEEFFECT"/>
        <value name="DELETEEFFECT"/>
      </enumeration>
      <enumeration name="org.modelio.metamodel.uml.behavior.interactionModel.InteractionOperator">
        <value name="SEQOP"/>
        <value name="ALTOP"/>
        <value name="OPTOP"/>
        <value name="BREAKOP"/>
        <value name="PAROP"/>
        <value name="STRICTOP"/>
        <value name="LOOPOP"/>
        <value name="CRITICALOP"/>
        <value name="NEGOP"/>
        <value name="ASSERTOP"/>
        <value name="IGNOREOP"/>
        <value name="CONSIDEROP"/>
      </enumeration>
      <enumeration name="org.modelio.metamodel.uml.behavior.interactionModel.MessageKind">
        <value name="COMPLETEKIND"/>
        <value name="LOSTKIND"/>
        <value name="FOUNDKIND"/>
        <value name="UNKNOWNKIND"/>
      </enumeration>
      <enumeration name="org.modelio.metamodel.uml.behavior.interactionModel.MessageSort">
        <value name="SYNCCALL"/>
        <value name="ASYNCCALL"/>
        <value name="ASYNCSIGNAL"/>
        <value name="DESTROYMESSAGE"/>
        <value name="CREATEMESSAGE"/>
        <value name="RETURNMESSAGE"/>
      </enumeration>
      <enumeration name="org.modelio.metamodel.uml.behavior.stateMachineModel.KindOfStateMachine">
        <value name="DYNAMIC"/>
        <value name="PROTOCOL"/>
      </enumeration>
      <enumeration name="org.modelio.metamodel.uml.statik.AggregationKind">
        <value name="KINDISASSOCIATION"/>
        <value name="KINDISAGGREGATION"/>
        <value name="KINDISCOMPOSITION"/>
      </enumeration>
      <enumeration name="org.modelio.metamodel.uml.statik.KindOfAccess">
        <value name="READ"/>
        <value name="WRITE"/>
        <value name="READWRITE"/>
        <value name="ACCESNONE"/>
      </enumeration>
      <enumeration name="org.modelio.metamodel.uml.statik.MethodPassingMode">
        <value name="METHODIN"/>
        <value name="METHODOUT"/>
      </enumeration>
      <enumeration name="org.modelio.metamodel.uml.statik.PassingMode">
        <value name="IN"/>
        <value name="OUT"/>
        <value name="INOUT"/>
      </enumeration>
      <enumeration name="org.modelio.metamodel.uml.statik.PortOrientation">
        <value name="NONE"/>
        <value name="IN"/>
        <value name="OUT"/>
        <value name="INOUT"/>
      </enumeration>
      <enumeration name="org.modelio.metamodel.uml.statik.VisibilityMode">
        <value name="PUBLIC"/>
        <value name="PROTECTED"/>
        <value name="PRIVATE"/>
        <value name="VISIBILITYUNDEFINED"/>
        <value name="PACKAGEVISIBILITY"/>
      </enumeration>
    </enumerations>
  </fragment>
  <fragment name="modelio.kernel" version="1.0.00" provider="Modeliosoft" providerVersion="1.0.00">
    <metaclasses>
      <metaclass name="SmObject" version="0.0.00" abstract="true">
        <attribute name="status" type="java.lang.Long"></attribute>
      </metaclass>
    </metaclasses>
    <enumerations></enumerations>
  </fragment>
</metamodel>    T Y�   sersV16!ftable_String! fmain!fmetamodel_descriptor.xml!fFORMAT_VERSION!�    g l�   sersV16!ftable_String! fmain!fmetamodel_descriptor.xml!fFORMAT_VERSION!�fGARBAGE_TABLES!�� �lftable_String! fusersV16!fmain!fmetamodel_descriptor.xml!f(idx.class.Infrastructure.ModuleComponent!fFORMAT_VERSION!�fGARBAGE_TABLES! ��g4��<?xml version="1.0" encoding="UTF-8"?>
<metamodel format="1" MetamodelDescriptor.format="1">
  <fragment name="Analyst" version="2.0.01" provider="Unknown" providerVersion="2.0.01" fake="true">
    <dependencies>
   