<#-- @formatter:off -->
(new Object(){
	public boolean canExtractEnergy(World world, int x, int y,int z) {
		AtomicBoolean _retval = new AtomicBoolean(false);
		TileEntity _ent = world.getTileEntity(x,y,z);
		if (_ent != null)
			EnergyHelper.isEnergyReceiverFromSide(_ent, ${input$direction});
		return _retval.get();
	}
}.canExtractEnergy(world,(int)${input$x},(int)${input$y},(int)${input$z}))
<#-- @formatter:on -->
