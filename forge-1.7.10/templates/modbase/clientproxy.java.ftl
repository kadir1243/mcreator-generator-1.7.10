<#-- @formatter:off -->
package ${package};

public class ClientProxy${JavaModName} implements IProxy${JavaModName} {

	@Override public void init(FMLInitializationEvent event) {
	}

	@Override public void preInit(FMLPreInitializationEvent event) {
		new ObjModelLoader().loadInstance(new ResourceLocation("${modid}"));
	}

	@Override public void postInit(FMLPostInitializationEvent event) {
	}

	@Override public void serverLoad(FMLServerStartingEvent event) {
	}

}
<#-- @formatter:on -->
