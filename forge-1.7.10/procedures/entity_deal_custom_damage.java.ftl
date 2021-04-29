if (${input$entity} instanceof EntityLiving) {
    ((EntityLiving) ${input$entity}).attackEntityFrom(new DamageSource(${input$localization_text}).setDamageBypassesArmor(), (float) ${input$damage_number});
}
