{*<!--
/*********************************************************************************
** The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
*
 ********************************************************************************/
-->*}
{strip}
	
	{foreach key=BLOCK_LABEL_KEY item=FIELD_MODEL_LIST from=$RECORD_STRUCTURE}
	{assign var=BLOCK value=$BLOCK_LIST[$BLOCK_LABEL_KEY]}
	{if $BLOCK eq null or $FIELD_MODEL_LIST|@count lte 0}{continue}{/if}
	{assign var=IS_HIDDEN value=$BLOCK->isHidden()}
	{assign var=BLOCK_ID value=$BLOCK_LIST[$BLOCK_LABEL_KEY]->get('id')}
	{assign var=BLOCK_HIDDEN_STYLE value=''}
	{if $BLOCK_ID eq 118}
		{assign var=BLOCK_HIDDEN_STYLE value='style="display:none;"'}
	{/if}
	{assign var=WIDTHTYPE value=$USER_MODEL->get('rowheight')}
	<input type=hidden name="timeFormatOptions" data-value='{$DAY_STARTS}' />
	<table class="table table-bordered equalSplit detailview-table" {$BLOCK_HIDDEN_STYLE}>
		<thead>
		<tr>
				<th class="blockHeader" colspan="4">
						<img class="cursorPointer alignMiddle blockToggle {if !($IS_HIDDEN)} hide {/if} "  src="{vimage_path('arrowRight.png')}" data-mode="hide" data-id={$BLOCK_LIST[$BLOCK_LABEL_KEY]->get('id')}>
						<img class="cursorPointer alignMiddle blockToggle {if ($IS_HIDDEN)} hide {/if}"  src="{vimage_path('arrowDown.png')}" data-mode="show" data-id={$BLOCK_LIST[$BLOCK_LABEL_KEY]->get('id')}>
						&nbsp;&nbsp;{vtranslate({$BLOCK_LABEL_KEY},{$MODULE_NAME})}
				</th>
		</tr>
		</thead>
		 <tbody {if $IS_HIDDEN} class="hide" {/if}>
			{assign var=COUNTER value=0}
			<tr>
				{foreach item=FIELD_MODEL key=FIELD_NAME from=$FIELD_MODEL_LIST}
					{if !$FIELD_MODEL->isViewableInDetailView()}
						{continue}
					{/if}
					{if $FIELD_MODEL->get('name') eq 'lead_view' or 
						$FIELD_MODEL->get('name') eq 'title' or 
						$FIELD_MODEL->get('name') eq 'phone_fax' or 
						$FIELD_MODEL->get('name') eq 'department' or 
						$FIELD_MODEL->get('name') eq 'signature' or
						$FIELD_MODEL->get('name') eq 'email2' or
						$FIELD_MODEL->get('name') eq 'phone_work' or
						$FIELD_MODEL->get('name') eq 'secondaryemail' or
						$FIELD_MODEL->get('name') eq 'phone_other' or 
						$FIELD_MODEL->get('name') eq 'internal_mailer' or
						$FIELD_MODEL->get('name') eq 'phone_crm_extension' or
						$FIELD_MODEL->get('name') eq 'reports_to_id' or
						$FIELD_MODEL->get('name') eq 'description' or
						$FIELD_MODEL->get('name') eq 'default_record_view' or
						$FIELD_MODEL->get('name') eq 'leftpanelhide' or
						$FIELD_MODEL->get('name') eq 'rowheight'
						}
						{continue}
					{/if}
					{if $FIELD_MODEL->get('uitype') eq "83"}
						{foreach item=tax key=count from=$TAXCLASS_DETAILS}
						{if $tax.check_value eq 1}
							{if $COUNTER eq 2}
								</tr><tr>
								{assign var="COUNTER" value=1}
							{else}
								{assign var="COUNTER" value=$COUNTER+1}
							{/if}
							<td class="fieldLabel {$WIDTHTYPE}">
							<label class='muted pull-right marginRight10px'>{vtranslate($tax.taxlabel, $MODULE)}(%)</label>
							</td>
							<td class="fieldValue {$WIDTHTYPE}">
								<span class="value">
									{$tax.percentage}
								</span>
							</td>
						{/if}
						{/foreach}
					{else if $FIELD_MODEL->get('uitype') eq "69" || $FIELD_MODEL->get('uitype') eq "105"}
						{if $COUNTER neq 0}
							{if $COUNTER eq 2}
								</tr><tr>
								{assign var=COUNTER value=0}
							{/if}
						{/if}
						<td class="fieldLabel {$WIDTHTYPE}"><label class="muted pull-right marginRight10px">{vtranslate({$FIELD_MODEL->get('label')},{$MODULE_NAME})}</label></td>
						<td class="fieldValue {$WIDTHTYPE}">
							<div id="imageContainer" width="300" height="200">
								{foreach key=ITER item=IMAGE_INFO from=$IMAGE_DETAILS}
									{if !empty($IMAGE_INFO.path) && !empty({$IMAGE_INFO.orgname})}
										<img src="{$IMAGE_INFO.path}_{$IMAGE_INFO.orgname}" width="300" height="200">
									{/if}
								{/foreach}
							</div>
						</td>
						{assign var=COUNTER value=$COUNTER+1}
					{else}
						{if $FIELD_MODEL->get('uitype') eq "20" or $FIELD_MODEL->get('uitype') eq "19"}
							{if $COUNTER eq '1'}
								<td class="{$WIDTHTYPE}"></td><td class="{$WIDTHTYPE}"></td></tr><tr>
								{assign var=COUNTER value=0}
							{/if}
						{/if}
						{if $COUNTER eq 2}
							</tr><tr>
							{assign var=COUNTER value=1}
						{else}
							{assign var=COUNTER value=$COUNTER+1}
						{/if}
						<td class="fieldLabel {$WIDTHTYPE}" id="{$MODULE_NAME}_detailView_fieldLabel_{$FIELD_MODEL->getName()}" {if $FIELD_MODEL->getName() eq 'description' or $FIELD_MODEL->get('uitype') eq '69'} style='width:8%'{/if}>
							<label class="muted pull-right marginRight10px">
								{vtranslate({$FIELD_MODEL->get('label')},{$MODULE_NAME})}
								{if ($FIELD_MODEL->get('uitype') eq '72') && ($FIELD_MODEL->getName() eq 'unit_price')}
									({$BASE_CURRENCY_SYMBOL})
								{/if}
							</label>
						</td>
						<td class="fieldValue {$WIDTHTYPE}" id="{$MODULE_NAME}_detailView_fieldValue_{$FIELD_MODEL->getName()}" {if $FIELD_MODEL->get('uitype') eq '19' or $FIELD_MODEL->get('uitype') eq '20'} colspan="3" {assign var=COUNTER value=$COUNTER+1} {/if}>
							<span class="value" data-field-type="{$FIELD_MODEL->getFieldDataType()}" {if $FIELD_MODEL->get('uitype') eq '19' or $FIELD_MODEL->get('uitype') eq '20' or $FIELD_MODEL->get('uitype') eq '21'} style="white-space:normal;" {/if}>
								{include file=vtemplate_path($FIELD_MODEL->getUITypeModel()->getDetailViewTemplateName(),$MODULE_NAME) FIELD_MODEL=$FIELD_MODEL USER_MODEL=$USER_MODEL MODULE=$MODULE_NAME RECORD=$RECORD}
							</span>
							{if $IS_AJAX_ENABLED && $FIELD_MODEL->isEditable() eq 'true' && ($FIELD_MODEL->getFieldDataType()!=Vtiger_Field_Model::REFERENCE_TYPE) && $FIELD_MODEL->isAjaxEditable() eq 'true'}
								<span class="hide edit">
									{include file=vtemplate_path($FIELD_MODEL->getUITypeModel()->getTemplateName(),$MODULE_NAME) FIELD_MODEL=$FIELD_MODEL USER_MODEL=$USER_MODEL MODULE=$MODULE_NAME}
									{if $FIELD_MODEL->getFieldDataType() eq 'multipicklist'}
										<input type="hidden" class="fieldname" value='{$FIELD_MODEL->get('name')}[]' data-prev-value='{$FIELD_MODEL->getDisplayValue($FIELD_MODEL->get('fieldvalue'))}' />
									{else}
										<input type="hidden" class="fieldname" value='{$FIELD_MODEL->get('name')}' data-prev-value='{Vtiger_Util_Helper::toSafeHTML($FIELD_MODEL->getDisplayValue($FIELD_MODEL->get('fieldvalue')))}' />
									{/if}
								</span>
							{/if}
						</td>
					{/if}
					{* {$FIELD_MODEL->get('name')} *}
					{if $FIELD_MODEL_LIST|@count eq 1 and $FIELD_MODEL->get('uitype') neq "19" and $FIELD_MODEL->get('uitype') neq "20" and $FIELD_MODEL->get('uitype') neq "30" and $FIELD_MODEL->get('name') neq "recurringtype" and $FIELD_MODEL->get('uitype') neq "69" and $FIELD_MODEL->get('uitype') neq "105"}
						<td class="fieldLabel {$WIDTHTYPE}"></td><td class="{$WIDTHTYPE}"></td>
					{/if}
				{/foreach}
				{* adding additional column for odd number of fields in a block *}
				{if $FIELD_MODEL_LIST|@end eq true and $FIELD_MODEL_LIST|@count neq 1 and $COUNTER eq 1}
					<td class="fieldLabel {$WIDTHTYPE}"></td><td class="{$WIDTHTYPE}"></td>
				{/if}
			</tr>
		</tbody>
	</table>
	<br>
	{/foreach}
{/strip}