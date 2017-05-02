<?php

/**
 * @file
 * Contains \Drupal\neogr_mod\Controller\NeogrFormController.
 */

namespace Drupal\demo_form\Controller;

use Drupal\Core\Controller\ControllerBase;
use Drupal\Core\Url;

/**
 * Returns responses for Demo Form module routes.
 */
class DemoFormController extends ControllerBase {

  /**
   * Controller content callback: Info page.
   *
   * @return string
   */
  public function infoPage() {

    $output['info'] = array(
      '#markup' => $this->t('Este es un ejemplo de formularios en Drupal 8. Los siguientes ejemplos están disponibles:'),
    );

    $output['urls'] = array(
      '#theme' => 'item_list',
      '#items' => array(
        $this->t('Una forma básica: @link.', array('@link' => \Drupal::l('/neogr/mod/basic', New Url('neogr_mod.basic_form')))),
      ),
    );

    return $output;
  }

}
