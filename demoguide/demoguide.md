[comment]: <> (please keep all comment items at the top of the markdown file)
[comment]: <> (please do not change the ***, as well as <div> placeholders for Note and Tip layout)
[comment]: <> (please keep the ### 1. and 2. titles as is for consistency across all demoguides)
[comment]: <> (section 1 provides a bullet list of resources + clarifying screenshots of the key resources details)
[comment]: <> (section 2 provides summarized step-by-step instructions on what to demo)


[comment]: <> (this is the section for the Note: item; please do not make any changes here)
***
### Deploy Deepseek-R1 on Azure Container Apps

<div style="background: lightgreen; 
            font-size: 14px; 
            color: black;
            padding: 5px; 
            border: 1px solid lightgray; 
            margin: 5px;">

**Note:** Below demo steps should be used **as a guideline** for doing your own demos. Please consider contributing to add additional demo steps.
</div>

[comment]: <> (this is the section for the Tip: item; consider adding a Tip, or remove the section between <div> and </div> if there is no tip)

***
### 1. What Resources are getting deployed
<add a one-paragraph lengthy description of what the scenario is about, and what is getting deployed>

Provide a bullet list of the Resource Group and all deployed resources with name and brief functionality within the scenario. 

* rg-%azdenvironmentname - Azure Resource Group.
* %azdenvironmentname-deepseek1 - Azure Container App instance
* %azdenvironmentname-workspace- Log Analytics workspace

<add a screenshot of the deployed Resource Group with resources>

<img src="https://raw.githubusercontent.com/daveRendon/azd-deepseek-r1-on-azure-container-apps/images/deepseekr1-rg.png" alt="Deepseek-R1 Resource Group" style="width:70%;">
<br></br>

<br></br>

### 2. What can I demo from this scenario after deployment

1. Once the deployment is complete, you can go to the URL of the container app. Then, start setting up the application with Open WebUI. 

![Deepseek-R1](images/deepseekr1-configure01.png)

Next, under the ‘Select a model’ option, look for DeepSeek-R1 as shown below:

![Deepseek-R1](images/deepseekr1-configure02.png)

Select DeepSeek-R1

![Deepseek-R1](images/deepseekr1-configure03.png)

Now you’re ready to start using it!


[comment]: <> (this is the closing section of the demo steps. Please do not change anything here to keep the layout consistant with the other demoguides.)
<br></br>
***
<div style="background: lightgray; 
            font-size: 14px; 
            color: black;
            padding: 5px; 
            border: 1px solid lightgray; 
            margin: 5px;">

**Note:** This is the end of the current demo guide instructions.
</div>