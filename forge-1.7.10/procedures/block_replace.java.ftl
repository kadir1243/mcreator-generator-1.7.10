<#include "mcitems.ftl">
{
	Block _bs = ${input$block};

	<#if field$state?lower_case == "true">
	Block _bso = world.getBlock(${input$x},${input$y},${input$z});
	for(Map.Entry<IProperty<?>, Comparable<?>> entry : _bso.getProperties().entrySet()) {
		IProperty _property = entry.getKey();
		if (_bs.getPropertyKeys().contains(_property))
			_bs = _bs.withProperty(_property, (Comparable) entry.getValue());
	}
	</#if>

	<#if field$nbt?lower_case == "true">
	TileEntity _te = world.getTileEntity(${input$x},${input$y},${input$z});
	NBTTagCompound _bnbt = null;
	if(_te != null) {
		_bnbt = _te.writeToNBT(new NBTTagCompound());
		_te.invalidate();
	}
	</#if>

	world.setBlock(${input$x},${input$y},${input$z}, _bs);

	<#if field$nbt?lower_case == "true">
	if(_bnbt != null) {
		_te = world.getTileEntity(_bp);
		if(_te != null) {
			try {
				_te.readFromNBT(_bnbt);
			} catch(Exception ignored) {}
		}
	}
	</#if>
}
