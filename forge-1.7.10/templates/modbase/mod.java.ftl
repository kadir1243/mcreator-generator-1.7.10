<#-- @formatter:off -->
/*
 *    MCreator note:
 *
 *    If you lock base mod element files, you can edit this file and the proxy files
 *    and they won't get overwritten. If you change your mod package or modid, you
 *    need to apply these changes to this file MANUALLY.
 *
 *    Settings in @Mod annotation WON'T be changed in case of the base mod element
 *    files lock too, so you need to set them manually here in such case.
 *
 *    Keep the Elements${JavaModName} object in this class and all calls to this object
 *    INTACT in order to preserve functionality of mod elements generated by MCreator.
 *
 *    If you do not lock base mod element files in Workspace settings, this file
 *    will be REGENERATED on each build.
 *
 */

package ${package};

@Mod(modid = ${JavaModName}.MODID, version = ${JavaModName}.VERSION
<#if settings.isServerSideOnly()>, acceptableRemoteVersions = "*"</#if>) public class ${JavaModName} {

	public static final String MODID = "${modid}";
	public static final String VERSION = "${settings.getVersion()}";

	public static final SimpleNetworkWrapper PACKET_HANDLER =
		NetworkRegistry.INSTANCE.newSimpleChannel("${modid[0..*18]}:a");

	@SidedProxy(clientSide = "${package}.ClientProxy${JavaModName}", serverSide = "${package}.ServerProxy${JavaModName}")
	public static IProxy${JavaModName} proxy;

	@Mod.Instance(MODID) public static ${JavaModName} instance;

	public Elements${JavaModName} elements = new Elements${JavaModName}();

	@Mod.EventHandler public void preInit(FMLPreInitializationEvent event) {
		MinecraftForge.EVENT_BUS.register(this);

		GameRegistry.registerWorldGenerator(elements, 5);
		GameRegistry.registerFuelHandler(elements);
		NetworkRegistry.INSTANCE.registerGuiHandler(this, new Elements${JavaModName}.GuiHandler());
		elements.preInit(event);
		MinecraftForge.EVENT_BUS.register(elements);
		elements.getElements().forEach(element -> element.preInit(event));

		proxy.preInit(event);
	}

	@Mod.EventHandler public void init(FMLInitializationEvent event) {
		elements.getElements().forEach(element -> element.init(event));
		GameRegistry.registerBlock((Block) elements.getBlocks(), (Class<? extends ItemBlock>) elements.getBlocks().getClass(),elements.getBlocks().getClass().getName());
		GameRegistry.registerItem((Item) elements.getItems(),elements.getItems().getClass().getName(),this.MODID);

		proxy.init(event);
	}

	@Mod.EventHandler public void postInit(FMLPostInitializationEvent event) {
		proxy.postInit(event);
	}

    @Mod.EventHandler public void serverLoad(FMLServerStartingEvent event) {
		elements.getElements().forEach(element -> element.serverLoad(event));

		proxy.serverLoad(event);
	}

	@SubscribeEvent public void registerBiomes(RegistryEvent.Register<BiomeGenBase> event) {
		event.getRegistry().registerAll(elements.getBiomes().stream().map(Supplier::get).toArray(BiomeGenBase[]::new));
	}

	@SubscribeEvent public void registerEntities(RegistryEvent.Register<Entity> event) {
		event.getRegistry().registerAll(elements.getEntities().stream().map(Supplier::get).toArray(Entity[]::new));
	}

	@SubscribeEvent public void registerPotions(RegistryEvent.Register<Potion> event) {
		event.getRegistry().registerAll(elements.getPotions().stream().map(Supplier::get).toArray(Potion[]::new));
	}

	@SubscribeEvent
	public void registerSounds(SoundRegistry event) {
		elements.registerSounds(event);
	}
	
	static {
		FluidRegistry.enableUniversalBucket();
	}

}
<#-- @formatter:on -->
