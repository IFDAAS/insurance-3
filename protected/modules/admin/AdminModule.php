<?php

class AdminModule extends CWebModule
{
	private $_config = array();
	public function init()
	{
		$config = require dirname(__FILE__).DIRECTORY_SEPARATOR.'config/main.php';
		$this->configure($config);
		// this method is called when the module is being created
		// you may place code here to customize the module or the application
		if (Yii::app()->user->isGuest){
			Yii::app()->request->redirect(Yii::app()->createUrl('user/login'));
		}
		// import the module-level models and components
        $this->setImport(array(
        	'admin.models.*',
            'admin.components.*',
        ));
        Yii::app()->setComponents(array('HelperAdmin'=>array('class'=>'application.modules.admin.components.HelperAdmin')));
	}

	public function beforeControllerAction($controller, $action)
	{
		if(parent::beforeControllerAction($controller, $action))
		{
			// this method is called before any module controller action is performed
			// you may place customized code here
			return true;
		}
		else
			return false;
	}


	public function __get($name){
		if (array_key_exists($name, $this->_config))
			return $this->_config[$name];
		else
			return parent::__get($name);
	}

	public function __set($name, $value){
	    try
	    {
	        parent::__set($name, $value);
	    }
	    catch (CException $e)
	    {
	        $this->_config[$name] = $value;
	    }
	}
}