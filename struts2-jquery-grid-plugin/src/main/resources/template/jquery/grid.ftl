<#--
/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
-->
<#assign escapedOptionId="${attributes.escapedId}">
<#if !attributes.subGrid!false>
<table id="${attributes.id}" cellpadding="0" cellspacing="0"
<#if attributes.cssStyle! != "">
 style="${attributes.cssStyle}"<#rt/>
</#if>
<#if attributes.cssClass! != "">
 class="${attributes.cssClass} scroll"<#rt/>
<#else>
 class="scroll"<#rt/>
</#if>
<#include "/${attributes.templateDir}/simple/scripting-events.ftl" />
<#include "/${attributes.templateDir}/simple/common-attributes.ftl" />
<#include "/${attributes.templateDir}/simple/dynamic-attributes.ftl" />
></table>
<#if attributes.pager!false || attributes.navigator!false>
<div id="${attributes.id}_pager"></div>
</#if>
</#if>

<#if attributes.subGrid!false>
	<#assign escapedParentOptionId="${attributes.parentGrid?string?replace('.', '_')}">
	options_${escapedParentOptionId}.subgrid = true;
	<#if attributes.subGridWidth! != "">
	options_${escapedParentOptionId}.subGridWidth = "${attributes.subGridWidth}";
	</#if>
<#else>
<script type='text/javascript' <#include "/${attributes.templateDir}/simple/nonce.ftl"/>>
jQuery(document).ready(function () {
	jQuery.struts2_jquery.require("js/struts2/jquery.grid.struts2"+jQuery.struts2_jquery.minSuffix+".js");
</#if>
	var options_${escapedOptionId} = {};
	options_${escapedOptionId}.frozen = false;
	var options_${escapedOptionId}_colmodels = new Array();
	var options_${escapedOptionId}_colnames = new Array();
