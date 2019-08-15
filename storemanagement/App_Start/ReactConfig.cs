using JavaScriptEngineSwitcher.Core;
using React;
using JavaScriptEngineSwitcher.V8;

[assembly: WebActivatorEx.PreApplicationStartMethod(typeof(storemanagement.ReactConfig), "Configure")]

namespace storemanagement
{
	public static class ReactConfig
	{
		public static void Configure()
		{
            ReactSiteConfiguration.Configuration
                .AddScript("~/Content/Tutorials.jsx");

        }
	}
}