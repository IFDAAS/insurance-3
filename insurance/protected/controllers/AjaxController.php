<?php

class AjaxController extends Controller
{

	public function actionGeocode(){
		if(isset($_POST['address'])){
			$xml = simplexml_load_file('http://maps.google.com/maps/api/geocode/xml?address='.$_POST['address'].'&sensor=false');
			// Если геокодировать удалось, то записываем в БД
			$status = $xml->status;
			//echo $xml;
			if ($status == 'OK') {
				$lat = $xml->result->geometry->location->lat;
				$lng = $xml->result->geometry->location->lng;
				echo json_encode(array('lat'=>$lat,'lng'=>$lng));
			} else {
				echo "<h4 style='color:#678;'>Geolocation Error!</h4>";
			}
		}
	}
	public function actionAutoCompleteRegion() {

		if (isset($_GET['q'])) {

			$criteria = new CDbCriteria;
			$criteria->condition = 'name LIKE :name';
			$criteria->params = array(':name'=>$_GET['q'].'%');
			$region = InsurRegion::model()->findAll($criteria);

			$resStr = '';
			foreach ($region as $region) {
				$resStr .= $region->name."\n";
			}
			echo $resStr;
		}
	}
}