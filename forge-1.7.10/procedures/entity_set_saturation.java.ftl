if (${input$entity} instanceof EntityPlayer) {
    ObfuscationReflectionHelper.setPrivateValue(FoodStats.class, ((EntityPlayer) ${input$entity}).getFoodStats(), (float)${input$amount}, "field_75125_b");
}
