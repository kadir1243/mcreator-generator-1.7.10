@SubscribeEvent public void onEntityDeath(LivingDeathEvent event){
		if(event!=null&&event.getEntity()!=null){
		Entity entity = event.getEntity();
		int i=(int)entity.posX;
		int j=(int)entity.posY;
		int k=(int)entity.posZ;
		World world=entity.worldObj;
		java.util.HashMap<String, Object> dependencies=new java.util.HashMap<>();
		dependencies.put("x",i);
		dependencies.put("y",j);
		dependencies.put("z",k);
		dependencies.put("world",world);
		dependencies.put("entity",entity);
		dependencies.put("event",event);
		this.executeProcedure(dependencies);
		}
		}
