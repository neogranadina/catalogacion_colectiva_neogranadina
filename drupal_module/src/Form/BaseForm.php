<?php

/**
* @file
* Contains \Drupal\neogranadina\form\BaseForm.
**/

namespace \Drupal\neogranadina\Form;

use Drupal\Core\Form\FormBase;
use Drupal\Core\Form\FormStateInterface;

class BaseForm extends FormBase {

	/**
	* {@inheritdoc}
	**/
public function getFormId(){
	return 'drupalform_base_form';
}

	/**
	* {@inheritdoc}
	**/
public function buildForm(array $form, FormStateInterface $form_state) {

	$form['titulo'] = array(
		'#type' => 'textfield',
		'#title' => $this->t('Título'),
		);
	$form['enviar'] = array(
		'#type' => 'submit',
		'#value' => $this->t('Guardar'),
		);
	return $form;
}

	/**
	* {@inheritdoc}
	**/

public function validateForm(array &$form, FormStateInterface $form_state) {
	parent::validateForm($form, $form_state);
}

	/**
	* {@inheritdoc}
	**/

public function submitForm(array &$form, FormStateInterface $form_state) {
	parent::validateForm($form, $form_state);
	}
}
