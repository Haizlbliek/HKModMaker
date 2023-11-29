extends Node

const ProjectFile: String = """<Project Sdk="Microsoft.NET.Sdk">
	<PropertyGroup>
		<HollowKnightRefs>^^HollowKnightRefs^^</HollowKnightRefs>
		<ExportDir>Export</ExportDir>
	</PropertyGroup>
	<PropertyGroup>
		<RootNamespace>^^Name^^</RootNamespace>
		<AssemblyName>^^AssemblyName^^</AssemblyName>
		<TargetFramework>net472</TargetFramework>
		<AssemblyTitle>^^AssemblyName^^</AssemblyTitle>
		<Product>^^Name^^</Product>
		<Description>^^Description^^</Description>
		<Copyright></Copyright>
		<AssemblyVersion>1.0.0.0</AssemblyVersion>
		<FileVersion>1.0.0.0</FileVersion>
		<OutputPath>bin/$(Configuration)/</OutputPath>
		<LangVersion>latest</LangVersion>
	</PropertyGroup>
	<Target Name="CopyMod" AfterTargets="PostBuildEvent">
		<MakeDir Condition="!Exists('$(HollowKnightRefs)/Mods/$(TargetName)/')" Directories="$(HollowKnightRefs)/Mods/$(TargetName)/" />
		<Copy SourceFiles="$(TargetPath);$(TargetDir)/$(TargetName).pdb;ReadMe.md" DestinationFolder="$(HollowKnightRefs)/Mods/$(TargetName)" SkipUnchangedFiles="true" />
	</Target>
	<ItemGroup>
		<Reference Include="Assembly-CSharp">
			<HintPath>$(HollowKnightRefs)/Assembly-CSharp.dll</HintPath>
		</Reference>
		<Reference Include="Assembly-CSharp-firstpass">
			<HintPath>$(HollowKnightRefs)/Assembly-CSharp-firstpass.dll</HintPath>
		</Reference>
		<Reference Include="GalaxyCSharp">
			<HintPath>$(HollowKnightRefs)/GalaxyCSharp.dll</HintPath>
		</Reference>
		<Reference Include="MMHOOK_Assembly-CSharp">
			<HintPath>$(HollowKnightRefs)/MMHOOK_Assembly-CSharp.dll</HintPath>
		</Reference>
		<Reference Include="MMHOOK_PlayMaker">
			<HintPath>$(HollowKnightRefs)/MMHOOK_PlayMaker.dll</HintPath>
		</Reference>
		<Reference Include="Mono.Cecil">
			<HintPath>$(HollowKnightRefs)/Mono.Cecil.dll</HintPath>
		</Reference>
		<Reference Include="Mono.Security">
			<HintPath>$(HollowKnightRefs)/Mono.Security.dll</HintPath>
		</Reference>
		<Reference Include="MonoMod.RuntimeDetour">
			<HintPath>$(HollowKnightRefs)/MonoMod.RuntimeDetour.dll</HintPath>
		</Reference>
		<Reference Include="MonoMod.Utils">
			<HintPath>$(HollowKnightRefs)/MonoMod.Utils.dll</HintPath>
		</Reference>
		<Reference Include="netstandard">
			<HintPath>$(HollowKnightRefs)/netstandard.dll</HintPath>
		</Reference>
		<Reference Include="Newtonsoft.Json">
			<HintPath>$(HollowKnightRefs)/Newtonsoft.Json.dll</HintPath>
		</Reference>
		<Reference Include="PlayMaker">
			<HintPath>$(HollowKnightRefs)/PlayMaker.dll</HintPath>
		</Reference>
		<Reference Include="System.ComponentModel.Composition">
			<HintPath>$(HollowKnightRefs)/System.ComponentModel.Composition.dll</HintPath>
		</Reference>
		<Reference Include="System.Configuration">
			<HintPath>$(HollowKnightRefs)/System.Configuration.dll</HintPath>
		</Reference>
		<Reference Include="System.Diagnostics.StackTrace">
			<HintPath>$(HollowKnightRefs)/System.Diagnostics.StackTrace.dll</HintPath>
		</Reference>
		<Reference Include="System.EnterpriseServices">
			<HintPath>$(HollowKnightRefs)/System.EnterpriseServices.dll</HintPath>
		</Reference>
		<Reference Include="System.Globalization.Extensions">
			<HintPath>$(HollowKnightRefs)/System.Globalization.Extensions.dll</HintPath>
		</Reference>
		<Reference Include="System.IO.Compression">
			<HintPath>$(HollowKnightRefs)/System.IO.Compression.dll</HintPath>
		</Reference>
		<Reference Include="System.Net.Http">
			<HintPath>$(HollowKnightRefs)/System.Net.Http.dll</HintPath>
		</Reference>
		<Reference Include="System.Runtime.Serialization.Xml">
			<HintPath>$(HollowKnightRefs)/System.Runtime.Serialization.Xml.dll</HintPath>
		</Reference>
		<Reference Include="System.ServiceModel.Internals">
			<HintPath>$(HollowKnightRefs)/System.ServiceModel.Internals.dll</HintPath>
		</Reference>
		<Reference Include="System.Transactions">
			<HintPath>$(HollowKnightRefs)/System.Transactions.dll</HintPath>
		</Reference>
		<Reference Include="System.Xml.XPath.XDocument">
			<HintPath>$(HollowKnightRefs)/System.Xml.XPath.XDocument.dll</HintPath>
		</Reference>
		<Reference Include="Unity.Timeline">
			<HintPath>$(HollowKnightRefs)/Unity.Timeline.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine">
			<HintPath>$(HollowKnightRefs)/UnityEngine.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.AccessibilityModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.AccessibilityModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.AIModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.AIModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.AndroidJNIModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.AndroidJNIModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.AnimationModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.AnimationModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.ARModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.ARModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.AssetBundleModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.AssetBundleModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.AudioModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.AudioModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.ClothModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.ClothModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.ClusterInputModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.ClusterInputModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.ClusterRendererModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.ClusterRendererModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.CoreModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.CoreModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.CrashReportingModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.CrashReportingModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.DirectorModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.DirectorModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.DSPGraphModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.DSPGraphModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.GameCenterModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.GameCenterModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.GIModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.GIModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.GridModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.GridModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.HotReloadModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.HotReloadModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.ImageConversionModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.ImageConversionModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.IMGUIModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.IMGUIModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.InputLegacyModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.InputLegacyModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.InputModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.InputModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.JSONSerializeModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.JSONSerializeModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.LocalizationModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.LocalizationModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.ParticleSystemModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.ParticleSystemModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.PerformanceReportingModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.PerformanceReportingModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.Physics2DModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.Physics2DModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.PhysicsModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.PhysicsModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.ProfilerModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.ProfilerModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.RuntimeInitializeOnLoadManagerInitializerModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.RuntimeInitializeOnLoadManagerInitializerModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.ScreenCaptureModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.ScreenCaptureModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.SharedInternalsModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.SharedInternalsModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.SpriteMaskModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.SpriteMaskModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.SpriteShapeModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.SpriteShapeModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.StreamingModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.StreamingModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.SubstanceModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.SubstanceModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.SubsystemsModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.SubsystemsModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.TerrainModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.TerrainModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.TerrainPhysicsModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.TerrainPhysicsModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.TextCoreModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.TextCoreModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.TextRenderingModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.TextRenderingModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.TilemapModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.TilemapModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.TLSModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.TLSModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.UI">
			<HintPath>$(HollowKnightRefs)/UnityEngine.UI.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.UIElementsModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.UIElementsModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.UIElementsNativeModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.UIElementsNativeModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.UIModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.UIModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.UmbraModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.UmbraModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.UNETModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.UNETModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.UnityAnalyticsModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.UnityAnalyticsModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.UnityConnectModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.UnityConnectModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.UnityCurlModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.UnityCurlModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.UnityTestProtocolModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.UnityTestProtocolModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.UnityWebRequestAssetBundleModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.UnityWebRequestAssetBundleModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.UnityWebRequestAudioModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.UnityWebRequestAudioModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.UnityWebRequestModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.UnityWebRequestModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.UnityWebRequestTextureModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.UnityWebRequestTextureModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.UnityWebRequestWWWModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.UnityWebRequestWWWModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.VehiclesModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.VehiclesModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.VFXModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.VFXModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.VideoModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.VideoModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.VirtualTexturingModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.VirtualTexturingModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.VRModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.VRModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.WindModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.WindModule.dll</HintPath>
		</Reference>
		<Reference Include="UnityEngine.XRModule">
			<HintPath>$(HollowKnightRefs)/UnityEngine.XRModule.dll</HintPath>
		</Reference>^^Dependencies^^
	</ItemGroup>
	<ItemGroup>
		<None Include="ReadMe.md" />
		<EmbeddedResource Include="Resources/*.png" />
	</ItemGroup>
	<ItemGroup>
		<PackageReference Include="HKBuildUtils" Version="0.6.1">
			<IncludeAssets>runtime; build; native; contentfiles; analyzers; buildtransitive</IncludeAssets>
			<PrivateAssets>all</PrivateAssets>
		</PackageReference>
	</ItemGroup>
</Project>"""

const ReadMe: String = """# ^^Name^^

^^Description^^"""

const ModSaveSettings: String = """using System.Collections.Generic;
using System.IO;
using System.Reflection;
using UnityEngine;

namespace ^^AssemblyName^^.ModSaveSettings {
	public class ModSaveSettings {
	}
}"""

const Makefile: String = """base:
	@dotnet build ProjectFile.csproj

github:
	@rm -rf obj
	@rm -rf bin
	@rm -rf Export
	@echo Code ready for github commit"""

const BaseMod: String = """using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Reflection;
using System.Security.Cryptography;
using HutongGames.PlayMaker;
using HutongGames.PlayMaker.Actions;
using Modding;^^ModSaveSettings^^^^UsingMods^^
using UnityEngine;
using GlobalEnums;

namespace ^^AssemblyName^^ {
	public class ^^AssemblyName^^^^ClassExtension^^ {
		public override string GetVersion() => "0.0.1";
		public new string GetName() => "^^Name^^";

		public override void Initialize() {}
	}
}"""


func generateDependency(dependency: String) -> String:
	return '\n\t\t<Reference Include="' + dependency + '">\n\t\t\t<HintPath>$(HollowKnightRefs)/Mods/' + dependency + '/' + dependency + '.dll</HintPath>\n\t\t</Reference>'

func getUsingKeys(dependency: String) -> String:
	if dependency == "SFCore":
		return "\nusing SFCore;\nusing SFCore.Generics;\nusing SFCore.Utils;"
	return ""
