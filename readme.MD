# Deploy Deepseek-r1 on Azure Container Apps 

👉 https://blog.azinsider.net/deploy-deepseek-r1-on-azure-container-apps-using-bicep-language-5f495724959e?source=friends_link&sk=6b78d1553b2edd0cf5115aee1844fe59

An `azd` template (Bicep) for quickly deploying Deepseek-R1 on Azure Container Apps.

### Prerequisites  

Before you can deploy this template, make sure you have the following tools  

- [Azure Developer CLI (azd)](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/install-azd)  
  - Installing `azd` also installs the following tools:  
    - [GitHub CLI](https://cli.github.com)  
    - [Bicep CLI](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/install)  
- You need Owner or Contributor permissions on an Azure Subscription to deploy this template.  

### Deployment

Once `azd` is installed on your machine, you can deploy this template using the following steps:

1. Run the `azd init` command in an empty directory with the `--template` parameter to clone this template into the current directory.  

    ```cmd
    azd init --template daverendon/azd-deepseek-r1-on-azure-container-apps
    ```

    When prompted, specify the name of the environment.

1. Run the `azd auth login` command to authenticate to your Azure subscription _(if you haven't already)_.

    ```cmd
    azd auth login
    ```

1. Run the `azd up` command to provision the resources in your Azure subscription. This will deploy both the infrastructure and the sample application. _(Use `azd provision` to only deploy the infrastructure.)_

    ```cmd
    azd up
    ```

    
1. Once the deployment is complete, you can go to the URL of the container app. Then, start setting up the application with Open WebUI. 

![Deepseek-R1](images\deepseekr1-configure01.png)

Next, under the ‘Select a model’ option, look for DeepSeek-R1 as shown below:

![Deepseek-R1](images\deepseekr1-configure02.png)

Select DeepSeek-R1

![Deepseek-R1](images\deepseekr1-configure03.png)

Now you’re ready to start using it!


Use the `azd down --purge` command to delete the resources.